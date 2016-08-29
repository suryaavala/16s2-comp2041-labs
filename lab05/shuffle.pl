#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab05
#shuffle.pl

use strict;
use POSIX;

my @lines;

while (<STDIN>){
  /\S/ or last;
  push @lines, $_;
}
my @temp = @lines;
#@temp = sort { $a <=> $b } qw(33 32 8 100);
my ($min,$max) = (sort {$a <=> $b} @temp)[0,-1];

#my $count = 5;
while ($#temp) {
  # body...
  #print "\n$x\n";
  my $ran = rand($max);
  $ran = ceil($ran);
  if ( grep( /^$ran$/, @temp ) ) {
  #TODO:

    @temp = grep { $_ != $ran } @temp;
    print "$ran\n";
}
#$count--;
}
print @temp;
