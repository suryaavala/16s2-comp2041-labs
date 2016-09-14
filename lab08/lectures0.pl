#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#courses.pl

use strict;
use warnings;

my $course_code = $ARGV[0];
my $url =  "http://timetable.unsw.edu.au/current/$course_code.html";
my @courses;
my $pattern = "Lecture";
#print "$course_code\n$url\n";

sub extract_http
{
  open F, "wget -q -O- $url|" or die;
  my $print_next = 0;
  while (my $line = <F>)
  {
    # $print_next = 1 if ($line =~ /$pattern/g);
    # $print_next++ if ($print_next);
    # if ($print_next ==7) {print"$line";last;}
    print"$line";
  }

  close(F);
}


&extract_http();
