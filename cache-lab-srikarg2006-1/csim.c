/**
 * @file csim.c
 * @brief Cache Simulator for 18213 Cachelab
 *
 * This program simulates a cache with custom parameters passed through
 * the command line:
 *  - s: number of set index bits
 *  - E: number of lines per set
 *  - b: number of block offset bits
 *  - t: input trace file containing memory accesses
 *
 * The simulator reads a tracefile of memory operations and models how a
 * cache of the specified parameters would run them. It tracks:
 *  - Hits: when a requested memory block is found
 *  - Misses: when a requested memory block needs to be loaded in
 *  - Evictions: when a block needs to be removed before adding a new block
 *  - Dirty bytes: number of dirty bytes left at the end of the simulation
 *  - Dirty evictions: dirty blocks that were evicted
 *
 * The cache is modeled as a 2-D array of sets and lines, with each line
 * containing a valid bit, dirty bit, tag, and lru counter (which is used
 * for implementing the least recently used replacement policy for evictions).
 * There are structs for representing the cache as a whole, individual sets,
 * and individual lines.
 *
 * The command line usage can be seen in function print_help_message().
 *
 */

#include "cachelab.h"
#include <ctype.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define LINELEN 128 // Maximum length of an instruction line in a trace file

// Function declarations for using getopt for processing command line arguments
int getopt(int argc, char *const argv[], const char *optstring);
extern char *optarg;

// This struct represents a singular cache line (or cache block)
typedef struct {
    bool is_valid;        // Indicates if the line contains valid data
    bool is_dirty;        // Indicates if the line was modified
    uint64_t tag;         // Tag used to identify between blocks within a set
    uint32_t lru_counter; // Used to keep track of the least recently used line
} line_t;

// This struct represnets a singular cache set with E lines
typedef struct {
    line_t *lines; // An array of cache lines of length E
} set_t;

/*
 * This struct represents the cache as a whole, with S sets
 * and E lines per set.
 */
typedef struct {
    set_t *sets; // An array of cache sets of length S
    int S;       // Number of sets
    int E;       // Associativity (number of lines per set)
} cache_t;

// These are the global variables used to keep track of the simulator state
bool VERBOSE = false;
int s = -1;
int b = -1;
int E = -1;
char *t = NULL;
csim_stats_t stats = {0, 0, 0, 0, 0}; // keeps track of the number of hits,
                                      // misses, evictions, dirty bytes, and
                                      // dirty evictions
cache_t *cache = NULL;

// This function prints the passes command line arguments (debug only)
void print_vals_debug(void) {
    printf("Parsed Arguments: \n");
    printf("    s = %d\n", s);
    printf("    b = %d\n", b);
    printf("    E = %d\n", E);
    printf("    t = %s\n", t);

    if (VERBOSE) {
        printf("    v = true\n");
    } else {
        printf("    v = false\n");
    }
}

// This function prints how to use the command line to pass arguments
void print_help_message(void) {
    printf("Mandatory arguments missing or zero.\n");
    printf("Usage: ./csim [-v] -s <s> -E <E> -b <b> -t <trace>\n");
    printf("       ./csim -h\n\n");
    printf("    -h Print this help message and exit\n");
    printf("    -v Verbose mode: report effects of each memory operation\n");
    printf("    -s <s> Number of set index bits (there are 2**s sets)\n");
    printf("    -b <b> Number of block bits (there are 2**b blocks)\n");
    printf("    -E <E> Number of lines per set ( associativity )\n");
    printf("    -t <trace> File name of the memory trace to process\n\n");
    printf("The -s, -b, -E, and -t options must be supplied for all "
           "simulations.\n");
}

/**
 * @brief Frees all structs associated with cache
 *
 * This function frees the memory allocated for the cache, and also updates
 * the number of dirty bytes left in the cache after the trace file is done
 * simulating.
 */
void free_cache(cache_t *cache, int b) {
    uint64_t block_size = 1 << b;
    for (int i = 0; i < cache->S; i++) {
        for (int j = 0; j < cache->E; j++) {
            line_t curr_line = cache->sets[i].lines[j];
            if (curr_line.is_dirty && curr_line.is_valid) {
                stats.dirty_bytes += block_size;
            }
        }
        free(cache->sets[i].lines);
    }
    free(cache->sets);
    free(cache);
}

/**
 * @brief Intializes cache
 *
 * Initializes the cache with 2^s sets, and E lines per set
 */
cache_t *init_cache(int s, int E) {
    int S = 1 << s;
    cache_t *cache = malloc(sizeof(cache_t));
    cache->S = S;
    cache->E = E;
    cache->sets = calloc(sizeof(set_t), (size_t)S);

    for (int i = 0; i < S; i++) {
        cache->sets[i].lines = calloc(sizeof(line_t), (size_t)E);
    }

    return cache;
}

/**
 * @brief updates LRU policy counter
 *
 * This function increments the LRU counters of all other valid lines
 * in the set. It is called after a line is accessed to update how recently
 * each of the other lines in a given set has been used relative to the new
 * line access.
 */
void increment_lru_counter(line_t *lines_arr, int line) {
    for (int i = 0; i < E; i++) {
        if (i != line && lines_arr[i].is_valid) {
            lines_arr[i].lru_counter++;
        }
    }
}

/**
 * @brief Simulates single memory access
 *
 * This function simulates an access to the cache for a single instruction.
 * It takes the memory address and operation (either 'L' or 'S') as inputs.
 */
void cache_access(uint64_t address, char op) {
    uint64_t tag = address >> (s + b);
    uint64_t block_size = 1 << b;
    uint64_t index = (address >> b) & ((1 << s) - 1);
    long lru_max = -1;
    int hit_line = -1;
    int available_line = -1;
    int lru_line = -1;

    set_t *set = &cache->sets[index];
    line_t *lines_arr = set->lines;

    /* This for loop is used to search for a hit, empty line,
     *  and least recently used line.
     */
    for (int i = 0; i < E; i++) {
        if (lines_arr[i].tag == tag && lines_arr[i].is_valid) {
            hit_line = i;
            break;
        }
        if (!lines_arr[i].is_valid) {
            available_line = i;
        }
        if ((int)lines_arr[i].lru_counter >= lru_max) {
            lru_max = lines_arr[i].lru_counter;
            lru_line = i;
        }
    }

    // Case 1: the memory access was a hit
    if (hit_line != -1) {
        if (op == 'S') {
            lines_arr[hit_line].is_dirty = true;
        }
        lines_arr[hit_line].lru_counter = 0;
        stats.hits++;

        increment_lru_counter(lines_arr, hit_line);
    }
    // Case 2: the memory access was a miss
    else {
        stats.misses++;

        // Subcase 1: use an empty line if available in the set
        if (available_line != -1) {
            lines_arr[available_line].tag = tag;
            lines_arr[available_line].is_valid = true;
            lines_arr[available_line].is_dirty = (op == 'S');
            lines_arr[available_line].lru_counter = 0;

            increment_lru_counter(lines_arr, available_line);
        }
        // Subcase 2: evict least recently used line if set is full
        else {
            if (lines_arr[lru_line].is_dirty) {
                stats.dirty_evictions += block_size;
            }
            stats.evictions++;
            lines_arr[lru_line].tag = tag;
            lines_arr[lru_line].is_valid = true;
            lines_arr[lru_line].is_dirty = (op == 'S');
            lines_arr[lru_line].lru_counter = 0;

            increment_lru_counter(lines_arr, lru_line);
        }
    }
}

/**
 * @brief Parses trace file
 *
 * This function parses the input trace file line-by-line and simulates a memory
 * access for each line using cache_access().
 */
int file_parser(char *trace) {
    FILE *parsed_tf = fopen(trace, "rt");

    if (parsed_tf == NULL) {
        fprintf(stderr, "Error opening tracefile '%s': %s\n", trace,
                strerror(errno));
        return 1;
    }

    char linebuf[LINELEN];
    int parse_error = 0;
    int line_num = 0;

    while (fgets(linebuf, LINELEN, parsed_tf)) {
        line_num++;

        if (linebuf[0] == '\n' || isspace(linebuf[0])) {
            continue;
        }

        int i = 0;
        while (linebuf[i] && isspace(linebuf[i])) {
            i++;
        }

        char op = linebuf[i];
        if ((op != 'S') && (op != 'L')) {
            fprintf(stderr, "Invalid op %c at line %d\n", op, line_num);
            parse_error = 1;
            continue;
        }

        i++;
        if (linebuf[i] != ' ') {
            fprintf(stderr, "Expected space after op at line %d\n", line_num);
            parse_error = 1;
            continue;
        }

        i++;
        char *hex_address = strtok(&linebuf[i], ",");
        char *size_str = strtok(NULL, "\n");

        if (size_str == NULL || hex_address == NULL) {
            fprintf(stderr, "Address or size missing at line %d\n", line_num);
            parse_error = 1;
            continue;
        }

        // Parsing the hexadecimal address
        char *end_ptr;
        uint64_t address = strtoul(hex_address, &end_ptr, 16);
        if (*end_ptr != '\0') {
            fprintf(stderr, "Invalid address %s at line %d\n", hex_address,
                    line_num);
            parse_error = 1;
            continue;
        }

        // Parsing the access size
        long size = strtol(size_str, &end_ptr, 10);
        if (*end_ptr != '\0' || size <= 0) {
            fprintf(stderr, "Invalid size %s at line %d\n", size_str, line_num);
            parse_error = 1;
            continue;
        }

        if (VERBOSE) {
            printf("Line %d parsed: OP=%c, ADDR=0x%lx, SIZE=%ld\n", line_num,
                   op, address, size);
        }

        cache_access(address, op);
    }

    fclose(parsed_tf);
    return parse_error;
}

/**
 * @brief Collects cache parameters and calls simulation functions
 *
 * The main function parses the command-line arguments, initializes the cache,
 * runs the simulator, and prints the summary of the statistics.
 */
int main(int argc, char **argv) {
    int opt;

    while ((opt = getopt(argc, argv, "s:b:E:t:vh")) != -1) {
        switch (opt) {
        case 'h':
            print_help_message();
            break;
        case 'v':
            VERBOSE = true;
            break;
        case 's':
            s = (int)strtoul(optarg, NULL, 10);
            break;
        case 'b':
            b = (int)strtoul(optarg, NULL, 10);
            break;
        case 'E':
            E = (int)strtoul(optarg, NULL, 10);
            break;
        case 't':
            t = optarg;
            break;
        default:
            printf("Invalid Inputs\n");
            print_help_message();
            return 1;
        }
    }

    // Validating the passed arguments
    if (s < 0 || b < 0 || E < 0 || t == NULL) {
        fprintf(stderr, "Invalid Inputs\n");
        print_help_message();
        return 1;
    }

    if (VERBOSE) {
        print_vals_debug();
    }

    cache = init_cache(s, E);
    int error = file_parser(t);
    free_cache(cache, b);
    printSummary(&stats);

    return error;
}
