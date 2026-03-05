#!/bin/bash

# ==============================================================================
# SCRIPT: char_finder.sh
# DESCRIPTION: Analyzes a string for length, captures a prefix, and finds the 
#              numerical index of a specific character.
# ==============================================================================

# 1. READ INPUT STRING
# Prompt the user for a string and store it in variable 'str'
read -p "enter a string: " str

# 2. CALCULATE LENGTH
# The ':' operator in 'expr' compares the string to the regex ".*" (all chars).
# It returns the number of characters that match the pattern.
n=$(expr "$str" : ".*")
echo "The length of the string is $n"

# 3. EXTRACT SUBSTRING (FIRST 3 CHARS)
# Regex Breakdown:
# \(...\) -> The backslashes escape the parentheses to create a "capture group".
# dots (...) -> Matches exactly three characters.
# .* -> Matches the rest of the string (not captured).
sub=$(expr "$str" : '\(...\).*')
echo "The substring of the string is $sub"

# 4. READ CHARACTER TO FIND
# We ask the user for a single character to locate within the string.
read -p "enter a character: " ch

# 5. LOCATE CHARACTER POSITION
# Logic: [^$ch]* matches every character that is NOT the target character.
# The final $ch matches the target. 'expr' returns the total length of the match.
i=$(expr "$str" : "[^$ch]*$ch")

# 6. OUTPUT RESULTS
# If 'expr' finds no match, it returns 0.
if [ $i -gt 0 ]
then 
    echo "Position of $ch is $i"
else
    echo "not found"
fi

# ==============================================================================
# SAMPLE OUTPUTS (THE ANSWERS):
# ==============================================================================
#
# CASE 1: Character exists in the string
# --------------------------------------
# enter a string: chocolate
# The length of the string is 9
# The substring of the string is cho
# enter a character: l
# Position of l is 6
#
# CASE 2: Character is the very first one
# --------------------------------------
# enter a string: apple
# The length of the string is 5
# The substring of the string is app
# enter a character: a
# Position of a is 1
#
# CASE 3: Character does not exist
# --------------------------------------
# enter a string: pizza
# The length of the string is 5
# The substring of the string is piz
# enter a character: x
# not found
#
# ==============================================================================
