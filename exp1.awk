BEGIN {
    FS = "," 
    # FS = Field Separator → tells AWK that columns are separated by commas (CSV format)

    printf "Filtering sales person to meet the criteria\n"
    # Prints a heading message before processing starts

    totalrevenue = 0
    # Initialize a variable to store total revenue of filtered records
}

{
    # This block runs for EACH line (record) in the input file

    if ($3 > 50 && $4 > 10000) {
        # Condition:
        # $3 → 3rd column (e.g., number of sales)
        # $4 → 4th column (e.g., revenue)
        # Only select rows where:
        #   sales > 50 AND revenue > 10000

        printf "Sales_id: %d, Name: %s, Revenue: %.2f\n", $1, $2, $4
        # Print formatted output:
        # $1 → Sales ID
        # $2 → Name
        # $4 → Revenue (printed with 2 decimal places)

        totalrevenue += $4
        # Add the revenue of this row to totalrevenue
    }
}

END {
    # This block runs AFTER processing all lines

    printf "Total revenue is: %.2f\n", totalrevenue
    # Print the final total revenue (only for filtered records)
}
