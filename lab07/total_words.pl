#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#prereq.pl


use strict;
use warnings;

#my @file_name = <STDIN>;

#print "@file_name\n";
my $words = 0;

foreach my $x (<STDIN>)
{
  #print "$x\n******\n";
  #my @temp = split(/[a-z]*/i, $x);
  #chomp ($x);
if ($x =~/^\s*$/)
{
  next;
}
else
{
  #print "$x\n*******\n";
  $x =~ s/[^a-zA-Z]/ /g;

  $x =~ s/\s+/ /g;


  my @temp = split(" ", $x);



  #print "$x\n@temp\n$#temp\n****$words****\n";
  $words = $words + $#temp + 1;
  #print "######$words@@@@@\n"

}
}
print "$words\n";
