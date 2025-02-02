/**
 * @file common.h
 * @author Rami MANI
 * @date 2025-02-02
 * @brief Brief description of the header file.
 *
 * This file contains function declarations, macros, and type definitions
 * for the common module.
 */

#ifndef COMMON_H
#define COMMON_H

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @defgroup commonGroup common Functions
 * @brief A collection of common functions.
 *
 * This module demonstrates how to use Doxygen for header file documentation.
 * @{
 */

/** 
 * @brief Macro to get the maximum of two values. 
 * 
 * This macro compares two values and returns the larger one.
 * 
 * @param[in] a First value.
 * @param[in] b Second value.
 * @return The larger of a and b.
 */
#define MAX(a, b) ((a) > (b) ? (a) : (b))

/**
 * @brief Structure representing a point in 2D space.
 */
typedef struct {
    int x; /**< X-coordinate of the point. */
    int y; /**< Y-coordinate of the point. */
} Point;

/**
 * @brief Adds two integers and returns the result.
 *
 * This function takes two integer inputs, adds them together, and returns the sum.
 *
 * @param[in] a First integer.
 * @param[in] b Second integer.
 * @return The sum of a and b.
 */
int add(int a, int b);

/**
 * @brief Prints a message to the console.
 *
 * This function displays a simple message to the standard output.
 *
 * @param[in] message A string containing the message to be printed.
 */
void printMessage(const char *message);

/** @} */ // End of commonGroup

#ifdef __cplusplus
}
#endif

#endif // COMMON_H
