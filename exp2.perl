# Example Run (Command Line):
# perl script.pl 123 456 789

# Expected Output:
# Sum of digits in number 123 is : 6
# Sum of digits in number 456 is : 15
# Sum of digits in number 789 is : 24

$count = scalar @ARGV;
# @ARGV → array storing command-line arguments
# scalar @ARGV → gives number of arguments passed
# $count stores total number of inputs

if ($count > 0) {
    # Check if at least one argument is passed

    foreach $num (@ARGV) {
        # Loop through each argument (number)

        $sum = 0;
        # Initialize sum of digits for current number

        $n = $num;
        # Copy original number into $n (to preserve $num)

        while ($n > 0) {
            # Loop until all digits are processed

            $rem = $n % 10;
            # Extract last digit using modulus operator

            $sum += $rem;
            # Add digit to sum

            $n = int($n / 10);
            # Remove last digit (integer division)
        }

        print "Sum of digits in number $num is : $sum\n";
        # Print result for current number
    }
} else {
    # If no arguments passed

    print "No arguments passed!";
    # Print message
}
