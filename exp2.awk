BEGIN {
    FS="|"
    # Set Field Separator as '|' → input file is pipe-separated

    total_basic=total_DA=total_HRA=total_gross=count=0
    # Initialize all totals and count to 0
    # total_basic → sum of basic salaries
    # total_DA → sum of Dearness Allowance
    # total_HRA → sum of House Rent Allowance
    # total_gross → sum of gross salaries
    # count → number of valid employees
}

($4=="sales" || $4=="marketing") {
    # Condition block:
    # Process ONLY those records where department ($4) is "sales" or "marketing"

    basic=$6
    # $6 → basic salary of employee

    DA=0.25*basic
    # DA = 25% of basic salary

    HRA=0.5*basic
    # HRA = 50% of basic salary

    gross=basic+DA+HRA
    # Gross salary = basic + DA + HRA

    total_basic+=basic
    # Add basic salary to total_basic

    total_DA+=DA
    # Add DA to total_DA

    total_HRA+=HRA
    # Add HRA to total_HRA

    total_gross+=gross
    # Add gross salary to total_gross

    count++
    # Increment count of valid employees

    printf "%-20s %-10s %-15s %.2f %.2f %.2f %.2f\n",$2,$3,$4,basic,DA,HRA,gross
    # Print formatted output:
    # %-20s → left-aligned string (Name, $2)
    # %-10s → left-aligned string (maybe designation, $3)
    # %-15s → left-aligned string (department, $4)
    # %.2f → floating numbers with 2 decimal places (basic, DA, HRA, gross)
}

END {
    # Executes after processing all records

    if(count>0) {
        # If at least one valid record exists

        printf "\nTotal Basic : %.2f\n", total_basic
        # Print total of basic salaries

        printf "Total DA : %.2f\n", total_DA
        # Print total DA

        printf "Total HRA : %.2f\n", total_HRA
        # Print total HRA

        printf "Total Gross : %.2f\n", total_gross
        # Print total gross salary

        printf "\nAverage Basic : %.2f\n", total_basic/count
        # Print average basic salary

        printf "Average DA : %.2f\n", total_DA/count
        # Print average DA

        printf "Average HRA : %.2f\n", total_HRA/count
        # Print average HRA

        printf "Average Gross : %.2f\n", total_gross/count
        # Print average gross salary
    }
    else {
        # If no matching records found

        printf "No records found for Sales or Marketing departments!\n"
        # Print message indicating no valid data
    }
}
