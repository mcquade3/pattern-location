#!/usr/local/bin/perl
# Mike McQuade
# pattern-location.pl
# Takes in a string and a pattern from an input file,
# then outputs the locations where the pattern appears.

use strict;
use warnings;

# Define local variables
my ($pattern,$genome,@locations);

# Open the file to read
open(my $fh,"<ba1d.txt") or die $!;

# Initialize pattern and genome variables with respective strings
$pattern = <$fh>;
$genome = <$fh>;
chomp($pattern);
chomp($genome);

# Iterate through the genome string
for (my $i = 0; $i <= (length($genome)-length($pattern)); $i++){
	# If the pattern is found in the string, add the location to the array
	if (substr($genome,$i,length($pattern)) eq $pattern) {
		push(@locations,$i);
	}
}

# Close the file
close($fh) || die "Couldn't close file properly";

# Define output string for locations found
my $output = "@locations\n";
chomp($output); # Remove whitespace after last number

# Print locations where the pattern was found
print $output;