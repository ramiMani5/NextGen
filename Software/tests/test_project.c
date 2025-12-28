/**
 * @file test_project.c
 * @author Rami MANI
 * @date 2025-12-29
 * @brief Brief description of what this file does.
 *
 * Detailed description of the file, including its purpose,
 * dependencies, and any other relevant information.
 */

#include <stdio.h>
#include <stdlib.h>
#include "test_project.h"

int main(void)
{
    /* Example test */
    if (TEST_1_FUNC(8) != 10) {
        fprintf(stderr, "Test failed: TEST_1_FUNC\n");
        return EXIT_FAILURE;
    }

    printf("All tests passed!\n");
    return EXIT_SUCCESS;
}
