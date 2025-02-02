/**
 * @file main.c
 * @author Rami MANI
 * @date 2025-02-02
 * @brief Brief description of what this file does.
 *
 * Detailed description of the file, including its purpose,
 * dependencies, and any other relevant information.
 */

#include <stdio.h>
#include "common.h"
#include "Cfg.h"

/**
 * @defgroup mainGroup main Functions
 * @brief A collection of main functions.
 *
 * This module demonstrates how to use Doxygen for documentation.
 * @{
 */



/** @} */ // End of mainGroup

/**
 * @brief Main function.
 *
 * Entry point of the program. Calls other functions for demonstration.
 *
 * @return Returns 0 upon successful execution.
 */
int main() {
#if defined(USE_SUM_FCT)
    int sum = add(5, 7);
    printf("Sum: %d\n", sum);
#else
    printMessage("USE_SUM_FCT is not defined");
#endif
    printMessage("Hello, Doxygen!");

    return 0;
}
