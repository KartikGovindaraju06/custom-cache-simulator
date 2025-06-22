/**
 * @file trans.c
 * @brief Contains various implementations of matrix transpose
 *
 * Each transpose function must have a prototype of the form:
 *   void trans(size_t M, size_t N, double A[N][M], double B[M][N],
 *              double tmp[TMPCOUNT]);
 *
 * All transpose functions take the following arguments:
 *
 *   @param[in]     M    Width of A, height of B
 *   @param[in]     N    Height of A, width of B
 *   @param[in]     A    Source matrix
 *   @param[out]    B    Destination matrix
 *   @param[in,out] tmp  Array that can store temporary double values
 *
 * A transpose function is evaluated by counting the number of hits and misses,
 * using the cache parameters and score computations described in the writeup.
 *
 * Programming restrictions:
 *   - No out-of-bounds references are allowed
 *   - No alterations may be made to the source array A
 *   - Data in tmp can be read or written
 *   - This file cannot contain any local or global doubles or arrays of doubles
 *   - You may not use unions, casting, global variables, or
 *     other tricks to hide array data in other forms of local or global memory.
 *
 * TODO: fill in your name and Andrew ID below.
 * @author Srikar Govindaraju <srikarg@andrew.cmu.edu>
 */

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>

#include "cachelab.h"

/**
 * @brief Checks if B is the transpose of A.
 *
 * You can call this function inside of an assertion, if you'd like to verify
 * the correctness of a transpose function.
 *
 * @param[in]     M    Width of A, height of B
 * @param[in]     N    Height of A, width of B
 * @param[in]     A    Source matrix
 * @param[out]    B    Destination matrix
 *
 * @return True if B is the transpose of A, and false otherwise.
 */
#ifndef NDEBUG
static bool is_transpose(size_t M, size_t N, double A[N][M], double B[M][N]) {
    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                fprintf(stderr,
                        "Transpose incorrect.  Fails for B[%zd][%zd] = %.3f, "
                        "A[%zd][%zd] = %.3f\n",
                        j, i, B[j][i], i, j, A[i][j]);
                return false;
            }
        }
    }
    return true;
}
#endif

/*
 * You can define additional transpose functions here. We've defined
 * some simple ones below to help you get started, which you should
 * feel free to modify or delete.
 */

/**
 * @brief A simple baseline transpose function, not optimized for the cache.
 *
 * Note the use of asserts (defined in assert.h) that add checking code.
 * These asserts are disabled when measuring cycle counts (i.e. when running
 * the ./test-trans) to avoid affecting performance.
 */
static void trans_basic(size_t M, size_t N, double A[N][M], double B[M][N],
                        double tmp[TMPCOUNT]) {
    assert(M > 0);
    assert(N > 0);

    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < M; j++) {
            B[j][i] = A[i][j];
        }
    }

    assert(is_transpose(M, N, A, B));
}

/**
 * @brief A contrived example to illustrate the use of the temporary array.
 *
 * This function uses the first four elements of tmp as a 2x2 array with
 * row-major ordering.
 */
static void trans_tmp(size_t M, size_t N, double A[N][M], double B[M][N],
                      double tmp[TMPCOUNT]) {
    assert(M > 0);
    assert(N > 0);

    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < M; j++) {
            size_t di = i % 2;
            size_t dj = j % 2;
            tmp[2 * di + dj] = A[i][j];
            B[j][i] = tmp[2 * di + dj];
        }
    }

    assert(is_transpose(M, N, A, B));
}

/**
 * @brief This is an optimized transpose function for 1024x1024 matrices
 * using 8x8 tiling.
 *
 * The matrix A is divided into many smaller 8x8 tiles, each of which has
 * a corresponding transposed tile in matrix B. For each element in one such
 * tile in A, we take that element at put it at the transposed index in B.
 * Unlike the 32x32 case, optimizations for the diagonal are not necessary
 * because the cache used for the 1024x1024 transpose is 8-way associative,
 * making conflict misses far less of an issue.
 */
void transpose_1024x1024(size_t M, size_t N, double A[N][M], double B[M][N],
                         double tmp[TMPCOUNT]) {
    size_t tile_size = 8;

    for (size_t i = 0; i < N; i += tile_size) {
        for (size_t j = 0; j < M; j += tile_size) {
            for (size_t x = i; x < i + tile_size; x++) {
                for (size_t y = j; y < j + tile_size; y++) {
                    B[y][x] = A[x][y];
                }
            }
        }
    }
}

/**
 * @brief This is an optimized transponse function for a 32x32 matrix using
 * 8x8 blocking with diagonal tile buffering to avoid conflict misses
 *
 * The general idea of tiling is the same with this function as it was for
 * the 1024x1024 function. Where it differs is how it deals with the diagonal
 * elements. Since the cache for this matrix transpose is direct-mapped,
 * accessing A[i][j] and B[j][i] for the same tile can cause conflict misses,
 * leading to many evictions.
 *
 * To mitigate this:
 * - The matrix is divided into 8x8 chunks
 * - Non-diagonal elements are transposed normally
 * - Diagonal elements are deferred and written later to prevent mapping to
 *   the same cache set as the corresponding element of A
 *
 * Additional Notes:
 * - a fixed offset is used (7 in this case) to ensure that the block of code
 *   copying the deferred elements along the diagonal into B only occurs after
 *   we have seen all of the diagonal elements within a given diagonal tile
 * - this allows for us to defer diagonal writes without using tmp[]
 */
void transpose_32x32(size_t M, size_t N, double A[N][M], double B[M][N],
                     double tmp[TMPCOUNT]) {

    size_t tile_size = 8;
    size_t offset = tile_size - 1;

    for (size_t i = 0; i < N; i += tile_size) {
        for (size_t j = 0; j < M; j += tile_size) {
            for (size_t x = 0; x < tile_size; x++) {
                for (size_t y = 0; y < tile_size; y++) {
                    if (x + i != y + j) { // handles non-diagonal elements
                        B[y + j][x + i] = A[x + i][y + j];
                    }
                    if (i == j &&
                        (y == offset)) { // handles copying from diagonal
                        B[x + i][x + i] = A[x + i][x + i]; // into matrix B
                    }
                }
            }
        }
    }
}

/**
 * @brief The solution transpose function that will be graded.
 *
 * You can call other transpose functions from here as you please.
 * It's OK to choose different functions based on array size, but
 * this function must be correct for all values of M and N.
 */
static void transpose_submit(size_t M, size_t N, double A[N][M], double B[M][N],
                             double tmp[TMPCOUNT]) {

    if (M == 32 && N == 32) {
        transpose_32x32(M, N, A, B, tmp);
        return;
    }

    if (M == 1024 && N == 1024) {
        transpose_1024x1024(M, N, A, B, tmp);
        return;
    }

    if (M == N)
        trans_basic(M, N, A, B, tmp);
    else
        trans_tmp(M, N, A, B, tmp);

    assert(is_transpose(M, N, A, B));
}

/**
 * @brief Registers all transpose functions with the driver.
 *
 * At runtime, the driver will evaluate each function registered here, and
 * and summarize the performance of each. This is a handy way to experiment
 * with different transpose strategies.
 */
void registerFunctions(void) {
    // Register the solution function. Do not modify this line!
    registerTransFunction(transpose_submit, SUBMIT_DESCRIPTION);

    // Register any additional transpose functions
    registerTransFunction(trans_basic, "Basic transpose");
    registerTransFunction(trans_tmp, "Transpose using the temporary array");
    registerTransFunction(transpose_1024x1024,
                          "Optimized for 1024x1024 matrices");
    registerTransFunction(transpose_32x32, "Optimized for 32x32 matrices");
}
