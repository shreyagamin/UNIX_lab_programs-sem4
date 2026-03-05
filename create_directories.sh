#!/bin/bash

# ==============================================================================
# SCRIPT: create_directories.sh (Expt. No. 10)
# DESCRIPTION: Accepts path names as arguments and creates them as directories.
#              For example, providing 'a/b/c' will create 'a', then 'a/b', 
#              and finally 'a/b/c'.
# ==============================================================================

# 1. ARGUMENT VALIDATION
# $# represents the number of arguments passed to the script.
if [ $# -eq 0 ]
then
    echo "No arguments provided"
    # Exit with status 1 to indicate an error occurred
    exit 1
fi

# 2. LOOP THROUGH ARGUMENTS
# $@ represents all arguments provided (e.g., path1 path2 path3)
for i in $@
do
    # 3. CREATE DIRECTORY
    # The '-p' flag is the "magic" here: it tells mkdir to create 
    # all parent directories as needed and NOT to throw an error if 
    # the directory already exists.
    mkdir -p $i
    
    # 4. CONFIRMATION
    # FIX: Changed $path to $i to correctly show the name of the created directory
    echo "Created directory for path: $i"
done

# ==============================================================================
# TERMINAL OUTPUT EXAMPLES (THE ANSWERS):
# ==============================================================================
#
# CASE 1: Creating a deep path
# Command: ./create_directories.sh photos/2026/vacation
# --------------------------------------------------
# Created directory for path: photos/2026/vacation
# (This creates the 'photos' folder, the '2026' folder inside it, 
#  and the 'vacation' folder inside that).
#
# CASE 2: Multiple arguments
# Command: ./create_directories.sh docs/work docs/personal
# --------------------------------------------------
# Created directory for path: docs/work
# Created directory for path: docs/personal
#
# CASE 3: No arguments
# Command: ./create_directories.sh
# --------------------------------------------------
# No arguments provided
# ==============================================================================