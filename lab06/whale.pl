#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#whale.pl
#30 August 2016

use strict;
use warnings;

my $key_word = $ARGV[0];
my @lines;

while (<STDIN>)
{
  /\S/ or last;
  push @lines, $_;
}

print "$key_word\n";
print @lines;
