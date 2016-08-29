#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab05
#echon.pl

use strict;

my $nb_args = $#ARGV + 1;
if ($nb_args != 2) {
    print "Usage: ./echon.pl <number of lines> <string> at ./echon.pl line 3.\n";
    exit;
}
my $num = $ARGV[0];
my $str = $ARGV[1];

while ($num){
  print "$str\n";
  $num--;
}
