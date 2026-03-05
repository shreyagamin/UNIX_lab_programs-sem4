#!/bin/bash

# ==============================================================================
# SCRIPT: simple_calculator.sh
# DESCRIPTION: Implements a basic calculator (Add, Subtract, Multiply, Divide)
#              using a 'case' statement and 'expr'.
# ==============================================================================

# 1. DISPLAY THE MENU
echo "--- Simple Calculator ---"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"

# 2. READ USER CHOICES AND DATA
read -p "Enter your choice (1-4): " ch
read -p "Enter first number: " a
read -p "Enter second number: " b

# 3. PERFORM CALCULATION BASED ON CHOICE
case $ch in
    1)
        # Addition logic
        result=$(expr $a + $b)
        echo "Result = $result"
        ;;
    2)
        # Subtraction logic
        result=$(expr $a - $b)
        echo "Result = $result"
        ;;
    3)
        # Multiplication logic
        # Note: The '*' must be escaped with a backslash (\*) in expr
        result=$(expr $a \* $b)
        echo "Result = $result"
        ;;
    4)
        # Division logic with safety check for zero
        if [ $b -eq 0 ]
        then
            echo "Error: Division by zero not allowed"
        else
            result=$(expr $a / $b)
            echo "Result = $result"
        fi
        ;;
    *)
        # Default case for invalid input
        echo "Invalid choice selected"
        ;;
esac

# ==============================================================================
# SAMPLE OUTPUTS (THE ANSWERS):
# ==============================================================================
#
# CASE 1: Multiplication
# Enter your choice: 3
# Enter first number: 5
# Enter second number: 4
# Result = 20
#
# CASE 2: Division by Zero
# Enter your choice: 4
# Enter first number: 10
# Enter second number: 0
# Error: Division by zero not allowed
#
# CASE 3: Invalid Menu Choice
# Enter your choice: 9
# Invalid choice selected
# ==============================================================================