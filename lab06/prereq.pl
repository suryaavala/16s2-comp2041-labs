#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#prereq.pl

use strict;
use warnings;


my $course = $ARGV[0];

#print "$course\n";

sub extract_http {
local $a = $_[0];
#print "$a\n";
open F, "wget -q -O- $a|" or die;

local $b="1";

while (my $c = <F>)
{
    if ($c =~ /^.*Prerequisite.*$/)
    {
      $b = $c;

    }
}

close(F);

#print "$b\n";
return $b;
}

my @url = ("http://www.handbook.unsw.edu.au/postgraduate/courses/2016/$course.html","http://www.handbook.unsw.edu.au/undergraduate/courses/2016/$course.html");

#http://www.handbook.unsw.edu.au/undergraduate/courses/2016/HESC3641.html
my @prelines=();
my @prereqs;

foreach my $x (@url) {
  # body...
  my $temp = &extract_http($x);
  if ($temp ne 1){
    push @prelines, $temp;
  }
}
#print "$prelines[0], $prelines[1]\n";


foreach my $x (@prelines) {
  # body...
  $x =~ s|<.+?>||g;
  my @words = split(" ",$x);
  foreach my $word (@words) {
    # body...
    if ($word =~ /^[A-Z]{4}[0-9]{4}/)
    {
      $word = substr($word, 0,8);
      push @prereqs, $word;
    }
  }

}

print "@prereqs\n";
