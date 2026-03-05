#!/bin/bash

# ==============================================================================
# SCRIPT: leap_year.sh
# DESCRIPTION: Checks if a given year is a leap year or not.
# ==============================================================================

# 1. Read the year from the user
read -p "Enter the year: " y

# 2. Leap Year Logic
# Case A: Divisible by 400
if [ $(expr $y % 400) -eq 0 ]
then
    echo "$y is a leap year"

# Case B: Divisible by 4 AND NOT divisible by 100
# -ne stands for "Not Equal To"
elif [ $(expr $y % 4) -eq 0 ] && [ $(expr $y % 100) -ne 0 ]
then
    echo "$y is a leap year"

# Case C: All other years
else
    echo "$y is not a leap year"
fi

# ==============================================================================
# SAMPLE OUTPUT:
# Enter the year: 2024
# 2024 is a leap year
#
# Enter the year: 2100
# 2100 is not a leap year
# ==============================================================================