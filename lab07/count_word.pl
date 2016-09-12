#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#prereq.pl

use strict;
use warnings;

my $word = lc $ARGV[0];
my %count;

foreach my $x (<STDIN>)
{
  # body...
  $x = lc $x;
  $x =~ s/[^a-zA-Z]/ /g;

  $x =~ s/\s+/ /g;

  my @temp = split(" ", $x);
  foreach my $i (@temp)
  {
    # body...
    $count{$i}++;
  }


}

print ($count{$word});
