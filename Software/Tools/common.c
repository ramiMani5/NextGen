/**
 * @file common.c
 * @author Rami MANI
 * @date 2025-02-02
 * @brief Brief description of what this file does.
 *
 * Detailed description of the file, including its purpose,
 * dependencies, and any other relevant information.
 */

#include <stdio.h>

/**
 * @defgroup commonGroup common Functions
 * @brief A collection of common functions.
 *
 * This module demonstrates how to use Doxygen for documentation.
 * @{
 */

/**
 * @brief Adds two integers and returns the result.
 *
 * This function takes two integer inputs, adds them together, and returns the sum.
 *
 * @param[in] a First integer.
 * @param[in] b Second integer.
 * @return The sum of a and b.
 */
int add(int a, int b) {
    return a + b;
}

/**
 * @brief Prints a message to the console.
 *
 * This function displays a simple message to the standard output.
 *
 * @param[in] message A string containing the message to be printed.
 */
void printMessage(const char *message) {
    if (message) {
        printf("%s\n", message);
    }
}

/** @} */ // End of commonGroup