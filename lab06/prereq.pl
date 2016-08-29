#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#prereq.pl

use strict;
use warnings;

my $course = $ARGV[0];

print "$course\n";

my $url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2016/$course.html";
open F, "wget -q -O- $url|" or die;

while (my $line = <F>) {
    print $line;
}

close(F);
