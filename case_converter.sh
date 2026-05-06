#!/bin/bash

# ==============================================================================
# SCRIPT: case_converter.sh
# DESCRIPTION: Renames files from lowercase to uppercase using 'tr' and 'mv'.
#              Includes safety checks to prevent overwriting existing files.
# ==============================================================================

# 1. ARGUMENT CHECK
# $# counts the number of arguments. If 0, the user provided no files.
if [ $# -eq 0 ] 
then
    echo "no arguments provided"
    exit 1
fi

# 2. FILE LOOPING
# "$@" treats each command-line argument as a separate file, even with spaces.
for file in "$@"
do
    # 3. EXISTENCE CHECK
    # -e checks if the file exists in the current directory.
    if [ -e "$file" ]
    then 
        # 4. CONVERT TO UPPERCASE
        # 'tr' (translate) takes the lowercase range and maps it to uppercase.
        upper=$(echo "$file" | tr '[:lower:]' '[:upper:]')

        # 5. COLLISION CHECK
        # Before renaming, we check if a file named $upper already exists.
        if [ -e "$upper" ]
        then 
            echo "cannot rename $file to $upper: file with name already exists"
        else 
            # 6. RENAME OPERATION
            # mv (move) is used here to rename the file.
            mv "$file" "$upper"
            echo "renamed $file to $upper"
        fi
    else
        # Error handling for typos or missing files
        echo "file $file does not exist in the directory"
    fi 
done

# ==============================================================================
# SAMPLE OUTPUTS (TERMINAL SIMULATION):
# ==============================================================================
#
# CASE 1: Successful Rename
# -------------------------
# $ touch notes.txt
# $ ./case_converter.sh notes.txt
# Output: renamed notes.txt to NOTES.TXT
#
# CASE 2: File Collision (Safety in action)
# ----------------------------------------
# $ touch report.pdf REPORT.PDF
# $ ./case_converter.sh report.pdf
# Output: cannot rename report.pdf to REPORT.PDF: file with name already exists
#
# CASE 3: Missing File
# --------------------
# $ ./case_converter.sh ghost.txt
# Output: file ghost.txt does not exist in the directory
#
# CASE 4: No Arguments
# --------------------
# $ ./case_converter.sh
# Output: no arguments provided
# ==============================================================================

# ==============================================================================
# GITHUB TIP:
# If you are on a Mac (which has a case-insensitive file system), 
# this script might behave differently because 'notes.txt' and 'NOTES.TXT' 
# are seen as the same file. It works best on Linux/Ubuntu!
# ==============================================================================
