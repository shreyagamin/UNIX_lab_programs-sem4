# Example Input File (example.txt):
# 2 4 5
# 7 8 9

# Expected Output:
# 2 4 5 11
# 7 8 9 24

BEGIN {
    FS=" "
    # Set Field Separator as space → input contains space-separated numbers
}

{
    sum=0
    # Initialize sum for each line

    split($0, num, " ")
    # Split entire line ($0) into array 'num' using space as delimiter
    # Example:
    # Line "2 4 5" → num[1]=2, num[2]=4, num[3]=5

    for(i in num) {
        # Loop through each element of array 'num'

        printf "%s ", num[i]
        # Print each number in the row

        sum += num[i]
        # Add each number to sum
    }

    printf "%s\n", sum
    # Print the total sum at the end of the row
}
