#!/bin/bash

# ==============================================================================
# SCRIPT: file_permission_check.sh
# DESCRIPTION: Takes two file names, checks if they exist, and compares their 
#              permissions. If identical, outputs the common permission; 
#              otherwise, outputs each file's specific permissions.
# ==============================================================================

# 1. READ INPUTS
# Prompting for the first and second file names
echo "Enter the first file: "
read file1
echo "Enter the second file: "
read file2

# 2. EXISTENCE CHECK
# -e checks if a file exists. -a represents the logical AND operator.
if [ -e $file1 -a -e $file2 ]
then 
    # 3. EXTRACT PERMISSIONS
    # 'ls -l' shows long format details.
    # 'cut -c 2-10' extracts characters 2 through 10 (the permission string).
    p1=`ls -l $file1 | cut -c 2-10`
    p2=`ls -l $file2 | cut -c 2-10`

    # 4. COMPARE PERMISSIONS
    if [ $p1 = $p2 ]
    then 
        # Output if both files have the same permission string
        echo "file $file1 and $file2 has same permission : $p1"
    else 
        # Output specific permissions if they are different
        echo "$file1 has permission : $p1"
        echo "$file2 has permission : $p2"
    fi
else 
    # Executed if one or both files do not exist in the directory
    echo "Invalid file name entered"
fi

# ==============================================================================
# SAMPLE OUTPUTS (THE ANSWERS):
# ==============================================================================
#
# CASE 1: Identical Permissions
# Enter the first file: script1.sh
# Enter the second file: script2.sh
# Output: file script1.sh and script2.sh has same permission : rwxr-xr-x
#
# CASE 2: Different Permissions
# Enter the first file: private.txt
# Enter the second file: public.txt
# Output: 
# private.txt has permission : rw-------
# public.txt has permission : rw-r--r--
#
# CASE 3: File Not Found
# Enter the first file: ghost.txt
# Enter the second file: real.txt
# Output: Invalid file name entered
# ==============================================================================