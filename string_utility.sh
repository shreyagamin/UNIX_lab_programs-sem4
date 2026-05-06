#!/bin/bash

# ==============================================================================
# SCRIPT: string_utility.sh
# DESCRIPTION: Performs length calculation, substring extraction, and 
#              character indexing using the 'expr' command.
# ==============================================================================

# 1. Read input string from the user
# The '-p' flag displays the prompt text on the same line as the cursor.
read -p "enter a string: " str

# 2. Calculate length
# The ':' operator matches the string against a regular expression.
# '.*' matches every character, and expr returns the total count (length).
n=$(expr "$str" : ".*")
echo "The length of the string is $n"

# 3. Extract substring (first 3 chars)
# Regex Breakdown:
# \(...\) -> Captures exactly the first three characters.
# .* -> Matches the rest of the string (this part is not captured).
# Note: Backslashes are needed to escape parentheses in the shell.
sub=$(expr "$str" : '\(...\).*')
echo "The substring of the string is $sub"

# 4. Read character to find
read -p "enter a character: " ch

# 5. Locate character position
# Logic: [^$ch]* matches all characters that are NOT the target character ($ch).
# The trailing $ch matches the first occurrence of the target character.
# 'expr' then returns the total number of characters matched up to that point.
i=$(expr "$str" : "[^$ch]*$ch")
echo "Position of $ch is $i"

# ==============================================================================
# EXPLANATION OF LOGIC:
# ==============================================================================
# - expr STRING : REGEX  -> This syntax tells Bash to perform a regex match.
# - ^ (Implicit)         -> In 'expr', the regex is automatically anchored to 
#                           the start of the string.
# - \(\)                 -> These are "capture groups" that tell 'expr' which 
#                           part of the match to actually return as a result.
# - [^$ch]               -> This is a "negated set"; it looks for anything 
#                           except the character you typed.

# ==============================================================================
# POSSIBLE OUTPUTS (SAMPLE RUNS):
# ==============================================================================
#
# CASE 1: Successful Search
# -------------------------
# enter a string: elephant
# The length of the string is 8
# The substring of the string is ele
# enter a character: p
# Position of p is 4
#
# CASE 2: Searching for the first character
# -----------------------------------------
# enter a string: banana
# The length of the string is 6
# The substring of the string is ban
# enter a character: b
# Position of b is 1
#
# CASE 3: Character not found
# ---------------------------
# enter a string: apple
# The length of the string is 5
# The substring of the string is app
# enter a character: z
# Position of z is 0 (Because the regex failed to find a match)
#
# ==============================================================================
