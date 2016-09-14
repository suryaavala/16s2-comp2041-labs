#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#courses.pl

use strict;
use warnings;

my $course_code = $ARGV[0];
my $url =  "http://www.timetable.unsw.edu.au/current/$course_code".""."KENS.html";
my @courses;

sub not_present
{
    my $a = grep(/@_/,@courses);
    #print "@_,$a\n";
    return 0 if $a;
    return 1;
}

sub extract_http
{
  #my $u = $_[0];
  #print "$a\n";
  open F, "wget -q -O- $url|" or die;

  #local $b="1";

  while (my $line = <F>)
  {

    my $temp_code = $& if $line =~ m/$course_code[0-9]{4}/g;
    #print "$temp_code\n" if $temp_code;
    #push @courses, $temp_code if ($temp_code and (grep $temp_code, @courses));
    #push @courses, $temp_code if ($temp_code and &not_present($temp_code));
    push @courses, $temp_code if ($temp_code and not grep(/$temp_code/,@courses));
    # if ($temp_code)
    # {
    #   my $t = grep(/$temp_code/, @courses);
    #   print "$t,$temp_code\n";
    # }
  }
  close(F);
}

&extract_http();
@courses = sort { lc($a) cmp lc($b) } @courses;
print "$_\n" foreach(@courses) 

#if (10 and 1) { print "1\n";}
