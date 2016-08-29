#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#whale.pl
#30 August 2016

use strict;
use warnings;

my $key_word = $ARGV[0];
my @lines;

#@whales = [[$whale_name,$count],...,[$whale_name,$count]]
my @whales;

while (<STDIN>)
{
  /\S/ or last;
  push @lines, $_;
}

#print "$key_word\n";
#print @lines;

foreach my $line (@lines)
{
  # body...
  my @words = split(" ",$line);
  my $count = $words[0];
  my $whale_name = join(" ",@words[1..$#words]);
  my @pod = ($whale_name, $count);
  push @whales, \@pod;
  #push @whales, \@($whale_name,$count);
}

my $pods=0;
my $individuals = 0;

foreach (@whales)
{
  # body...
  my @pod = @$_;
  if ($pod[0] eq $key_word)
  {
    $pods++;
    $individuals = $individuals + $pod[1];
  }
  #print "@pod[0], @pod[1]\n";

}

print "$key_word observations: $pods pods, $individuals individuals\n";
