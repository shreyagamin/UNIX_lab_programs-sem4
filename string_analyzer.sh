#!/bin/bash

# ==============================================================================
# SCRIPT: string_analyzer.sh
# DESCRIPTION: A Bash script to calculate string length and slice it using 'expr'
# ==============================================================================

# Step 1: Request user input
# The '-p' flag allows us to put the prompt text on the same line as the input.
read -p "enter the string: " str

# Step 2: Validation - Check if the string is empty
# [ -z "$str" ] is true if the string length is zero (user just pressed Enter).
if [ -z "$str" ]
then 
    echo "invalid string"
else
    # Step 3: Calculate string length using 'expr'
    # The ':' operator matches the string against the regex ".*" (matches all).
    # It returns the number of characters matched.
    n=$(expr "$str" : ".*")
    echo "Length of the string = $n"

    # Step 4: Logic gate for minimum length
    # Check if the length ($n) is Greater than or Equal to (-ge) 6.
    if [ $n -ge 6 ]
    then 
        # Step 5: Extract the first 3 characters
        # Regex: \(...\) captures exactly 3 characters. 
        # .* matches the rest of the string but is NOT captured.
        first=$(expr "$str" : '\(...\).*')
        echo "the first 3 characters of the string : $first"
        
        # Step 6: Extract the last 3 characters
        # Regex: .* matches everything up until the final three dots.
        # \(...\) captures those final 3 characters at the end.
        last=$(expr "$str" : '.*\(...\)')
        echo "the last 3 characters of the string : $last"
    else
        # Executed if the string is between 1 and 5 characters long.
        echo "string length less than 6"
    fi
fi

# ==============================================================================
# SAMPLE OUTPUTS (What you see in the terminal):
# ==============================================================================
# 
# CASE 1: Valid String (Longer than 6)
# enter the string: Programming
# Length of the string = 11
# the first 3 characters of the string : Pro
# the last 3 characters of the string : ing
#
# CASE 2: Short String (Less than 6)
# enter the string: Hello
# Length of the string = 5
# string length less than 6
#
# CASE 3: Empty Input
# enter the string: 
# invalid string
#
# ==============================================================================
