size_t get_cache_index(double *address) {
    size_t index = ((size_t)address >> 6) & ((1 << 5) - 1);
    return index;
}

void transpose_32x32(size_t M, size_t N, double A[N][M], double B[M][N],
                             double tmp[TMPCOUNT]) {
    printf("A start address: %zx\n", (unsigned long)(&A));
    printf("B start address: %zx\n", (unsigned long)(&B));
    printf("TMP start address: %zx\n", (unsigned long)(&tmp));
    size_t tile_size = 8;
    size_t offset;
    size_t index;

    for (size_t i = 0; i < N; i += tile_size) {
        for (size_t j = 0; j < M; j += tile_size) {
            if (i == j) {
                printf("---------------------------\n");
                printf("Tile indices (i, j): (%ld, %ld)\n", i, j);
                offset = 8;
                for (size_t x = 0; x < tile_size; x++) {
                    for (size_t y = 0; y < tile_size; y++) {
                        index = x * tile_size + y + offset;
                        printf("Accessing A[%ld][%ld] at set index: %ld\n", 
                                x + i, y + j, get_cache_index(&(A[x + i][y + j])));
                        
                        printf("Accessing tmp[%ld] at set index: %ld\n", 
                                index, get_cache_index(&(tmp[index])));
                        tmp[index] = A[x + i][y + j];
                    }
                }
                printf("\n");
                for (size_t x = 0; x < tile_size; x++) {
                    for (size_t y = 0; y < tile_size; y++) {
                        index = x * tile_size + y + offset;
                        printf("Accessing B[%ld][%ld] at set index: %ld\n", 
                                y + j, x + i, get_cache_index(&(B[y + j][x + i])));

                        printf("Accessing tmp[%ld] at set index: %ld\n", 
                                index, get_cache_index(&(tmp[index])));
                        B[y + j][x + i] = tmp[index];
                    }
                }
                printf("\n");
            }
            else {
                for (size_t x = 0; x < tile_size; x++) {
                    for (size_t y = 0; y < tile_size; y++) {
                        B[y + j][x + i] = A[x + i][y + j];
                    }
                }
            }
        }
    }
}