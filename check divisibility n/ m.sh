#!/bin/bash

# ==============================================================================
# SCRIPT: divisibility.sh (Image 2)
# DESCRIPTION: Checks if number 'n' is divisible by 'm'. 
#              Includes a safety check for division by zero.
# ==============================================================================

# 1. READ INPUTS
read -p "Enter the value of n: " n
read -p "Enter the value of m: " m

# 2. SAFETY CHECK: Division by zero is mathematically impossible
if [ $m -eq 0 ]
then
    echo "Division is not possible"

# 3. CALCULATE MODULUS
# We use $(expr $n % $m) to find the remainder. 
# If the remainder is 0, it is divisible.
elif [ $(expr $n % $m) -eq 0 ]
then
    echo "$n is divisible by $m"
else
    echo "$n is not divisible by $m"
fi

# ==============================================================================
# SAMPLE OUTPUTS:
# 1. n=10, m=2  -> 10 is divisible by 2
# 2. n=10, m=3  -> 10 is not divisible by 3
# 3. n=10, m=0  -> Division is not possible
# ==============================================================================