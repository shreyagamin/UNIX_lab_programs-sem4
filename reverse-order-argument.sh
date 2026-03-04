#!/bin/bash

# ==============================================================================
# SCRIPT: reverse_args.sh
# DESCRIPTION: Takes command-line arguments and prints them normally 
#              and then in reverse order using a C-style for loop.
# ==============================================================================

# 1. Check if any arguments were provided ($# is the count of arguments)
if [ $# -eq 0 ] 
then
    # If the user runs the script without typing anything after the name
    echo "no arguments provided"
    exit 1
fi

# 2. Display arguments in the order they were typed
# $@ represents all arguments as a single string
echo "arguments in the same order : $@"

# 3. Display arguments in reverse order
echo "Arguments in reverse order:"

# 4. Loop starting from the last argument index ($#) down to 1
# This is a C-style loop: (start; condition; decrement)
for (( i=$#; i>0; i-- ))
do 
    # EXPLANATION OF 'eval':
    # If i=3, the shell first sees \${$i} as ${3}.
    # 'eval' then executes 'echo $3', which prints the third argument.
    # This is known as "Indirect Referencing."
    eval echo \${$i}
done

# ==============================================================================
# TERMINAL OUTPUT EXAMPLES (ANSWERS):
# ==============================================================================
#
# CASE 1: Three Arguments
# Command: ./reverse_args.sh Apple Banana Cherry
# --------------------------------------------------
# arguments in the same order : Apple Banana Cherry
# Arguments in reverse order:
# Cherry
# Banana
# Apple
#
# CASE 2: Numerical Arguments
# Command: ./reverse_args.sh 10 20 30
# --------------------------------------------------
# arguments in the same order : 10 20 30
# Arguments in reverse order:
# 30
# 20
# 10
#
# CASE 3: No Arguments
# Command: ./reverse_args.sh
# --------------------------------------------------
# no arguments provided
# (Script exits with status 1)
# ==============================================================================

# ==============================================================================
# GITHUB NOTE: 
# $# = Total number of arguments.
# $@ = All arguments together.
# $i = The current loop index (3, 2, 1...).
# ==============================================================================
