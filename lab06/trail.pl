#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#prereq.pl

use strict;
use warnings;

my $rec;
my $course;
if ($#ARGV == 1)
{
  $rec = "1";
  $course = $ARGV[1];
}
else
{
  $rec = "0";
  $course = $ARGV[0]
}

my @prereqs;
#print "$rec, $course\n";

sub extract_http
{
  local $a = $_[0];
  #print "$a\n";
  open F, "wget -q -O- $a|" or die;

  local $b="1";

  while (my $c = <F>)
  {
      if ($c =~ /^.*Prerequisite.*$/)
      {
        $b = $c;
        last;
      }
  }

  close(F);

  if ($b ne 1)
  {
    $b =~ s|<.+?>||g;
    my @words = split(" ",$b);
    foreach my $word (@words) {
      # body...
      if ($word =~ /^[A-Z]{4}[0-9]{4}/)
      {

        $word = substr($word, 0,8);
        if ( !grep (/^$word$/,@prereqs)){
          push @prereqs, $word;
        }
      }
    }
  }
  #print "$b\n";
  return;
}


# sub extract_prereqs
# {
#   my @url = ("http://www.handbook.unsw.edu.au/postgraduate/courses/2016/$course.html","http://www.handbook.unsw.edu.au/undergraduate/courses/2016/$course.html");
#
#   #http://www.handbook.unsw.edu.au/undergraduate/courses/2016/HESC3641.html
#   my @prelines=();
#
#
#   foreach my $x (@url) {
#     # body...
#     my $temp = &extract_http($x);
#     if ($temp ne 1){
#       push @prelines, $temp;
#     }
#   }
#   #print "$prelines[0], $prelines[1]\n";
#
#
#   foreach my $x (@prelines) {
#     # body...
#     $x =~ s|<.+?>||g;
#     my @words = split(" ",$x);
#     foreach my $word (@words) {
#       # body...
#       if ($word =~ /^[A-Z]{4}[0-9]{4}/)
#       {
#         $word = substr($word, 0,8);
#         push @prereqs, $word;
#       }
#     }
#
#   }
#
#   # foreach my $x (sort @prereqs) {
#   #   # body...
#   #   print "$x\n";
#   # }
#
# }

sub extract_prereqs
{
  local $a = $_[0];
  my @url = ("http://www.handbook.unsw.edu.au/postgraduate/courses/2016/$a.html","http://www.handbook.unsw.edu.au/undergraduate/courses/2016/$a.html");

  #http://www.handbook.unsw.edu.au/undergraduate/courses/2016/HESC3641.html


  ########################
  #my @prelines=();
  # foreach my $x (@url) {
  #   # body...
  #   my $temp = &extract_http($x);
  #   if ($temp ne 1){
  #     push @prelines, $temp;
  #   }
  # }
  #print "$prelines[0], $prelines[1]\n";
  ##########################

foreach my $x (@url) {
#   # body...
#   my $temp = &extract_http($x);
#   if ($temp ne 1){
#     $temp =~ s|<.+?>||g;
#     my @words = split(" ",$temp);
#     foreach my $word (@words) {
#       # body...
#       if ($word =~ /^[A-Z]{4}[0-9]{4}/)
#       {
#         $word = substr($word, 0,8);
#         push @prereqs, $word;
#       }
#     }
#   }
  &extract_http($x);
  }
  ##########################################
  # foreach my $x (@prelines) {
  #   # body...
  #   $x =~ s|<.+?>||g;
  #   my @words = split(" ",$x);
  #   foreach my $word (@words) {
  #     # body...
  #     if ($word =~ /^[A-Z]{4}[0-9]{4}/)
  #     {
  #       $word = substr($word, 0,8);
  #       push @prereqs, $word;
  #     }
  #   }
  #
  # }
  ###########################################
  return;

}


&extract_prereqs($course);

if ($rec eq "1")
{
  foreach my $x (@prereqs) {
    # body...
    #print "$x\n";
    &extract_prereqs($x);
  }

}

foreach my $x (sort @prereqs) {
  # body...
  print "$x\n";
}
