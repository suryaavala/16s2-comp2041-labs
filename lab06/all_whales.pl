#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#all_whales.pl
#30 August 2016
#30 August 2016

use strict;
use warnings;


my @lines;

#%whale_base{$whale_name} = \@($pods, $individuals)
my %whale_base;
my @whales;

sub process_names
{
    local $a = join(" ",@_);
    #lower case
    $a = lc $a;
    if ($a =~ /.*[s]$/ && $a =~ /(?!.*'[s])$/)
    {
      #print "\n******$a\n";
      $a = substr($a, 0,-1);
      #print "\n--------$a\n"
    }
    return $a;
}

while (<STDIN>)
{
  /\S/ or last;
  push @lines, $_;
}



foreach my $line (@lines)
{
  # body...
  my @words = split(" ",$line);
  my $count = $words[0];
  my $whale_name = join(" ",@words[1..$#words]);
  $whale_name = &process_names($whale_name);
  my @new_entry;
  if (exists $whale_base{$whale_name})
  {
      my $temp_entry = $whale_base{$whale_name};
      my $pods = @$temp_entry[0] + 1;
      my $individuals = @$temp_entry[1] + $count;
      @new_entry = ($pods, $individuals);
  }
  else
  {
      my $pods = 1;
      @new_entry = ($pods, $count);
  }
  $whale_base{$whale_name} = \@new_entry;
}


foreach my $whale (sort keys %whale_base)
{
  # body...
  my $temp_entry = $whale_base{$whale};
  my $pods = @$temp_entry[0];
  my $individuals = @$temp_entry[1];

  print "$whale observations: $pods pods, $individuals individuals\n";

}
