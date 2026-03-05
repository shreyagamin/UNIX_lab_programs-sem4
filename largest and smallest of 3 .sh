#!/bin/bash

# ==============================================================================
# SCRIPT: find_extremes.sh
# DESCRIPTION: Finds the largest and smallest of three numbers provided by user.
# LOGIC: Uses nested if-elif-else statements with logical AND (&&) operators.
# ==============================================================================

# 1. READ INPUT
# Asks the user to input three numbers separated by spaces.
read -p "Enter three numbers: " a b c

# ------------------------------------------------------------------------------
# 2. FIND THE GREATEST NUMBER
# ------------------------------------------------------------------------------
# Check if 'a' is greater than both 'b' and 'c'
if [ $a -gt $b ] && [ $a -gt $c ]
then
    echo "$a is the greatest"
# If 'a' wasn't greatest, check if 'b' is greater than 'a' and 'c'
elif [ $b -gt $a ] && [ $b -gt $c ]
then
    echo "$b is the greatest"
# If neither 'a' nor 'b' are the greatest, 'c' must be the greatest
else
    echo "$c is the greatest"
fi

# ------------------------------------------------------------------------------
# 3. FIND THE SMALLEST NUMBER
# ------------------------------------------------------------------------------
# Check if 'a' is less than both 'b' and 'c'
if [ $a -lt $b ] && [ $a -lt $c ]
then
    echo "$a is the smallest"
# If 'a' wasn't smallest, check if 'b' is less than 'a' and 'c'
elif [ $b -lt $a ] && [ $b -lt $c ]
then
    echo "$b is the smallest"
# If neither 'a' nor 'b' are the smallest, 'c' must be the smallest
else
    echo "$c is the smallest"
fi

# ==============================================================================
# TERMINAL OUTPUT EXAMPLES (THE ANSWERS):
# ==============================================================================
#
# CASE 1: Different numbers
# Enter three numbers: 10 25 5
# 25 is the greatest
# 5 is the smallest
#
# CASE 2: Negative numbers
# Enter three numbers: -1 -5 -10
# -1 is the greatest
# -10 is the smallest
#
# CASE 3: Large numbers
# Enter three numbers: 1000 50 500
# 1000 is the greatest
# 50 is the smallest
# ==============================================================================

# ==============================================================================
# KEY OPERATORS EXPLAINED:
# -gt : Greater Than
# -lt : Less Than
# &&  : Logical AND (both conditions must be true)
# ==============================================================================