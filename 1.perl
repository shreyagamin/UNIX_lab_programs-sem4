#!/usr/bin/perl
use strict;
use warnings;

# Prompt the user for a string
print "Enter a string: ";
# We keep the newline character at the end of $a 
# so that each repetition appears on a separate line.
my $a = <STDIN>;

# Prompt the user for a number
print "Enter a number: ";
# chomp removes the newline character from the number input
chomp(my $n = <STDIN>);

# The 'x' operator in Perl is the repetition operator.
# It repeats the string in $a exactly $n times.
my $c = $a x $n;

# Print the final result
print "Result is:\n$c";
/*
=begin comment
OUTPUT:
Enter a string: zoombie
Enter a number: 3
Result is:
zoombie
zoombie
zoombie
=end comment
*/
