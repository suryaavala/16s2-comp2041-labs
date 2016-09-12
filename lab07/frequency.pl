#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab06
#prereq.pl

use strict;
use warnings;
use Data::Dumper;

my $word = lc $ARGV[0];
my %count;
my $dir = "./poems/";
my $poet = "";
my @files;
my @poets;
my %words;

sub word_frequency
{
  local $a = $_[0];
  $a = $dir.''.$a;

  open my $tempfile, $a or die "Could not open $a: $!";

  while( my $x = <$tempfile>)
  {
    if ($x =~/^\s*$/)
    {
      next;
    }
    else
    {
      $x = lc $x;
      $x =~ s/[^a-zA-Z]/ /g;

      $x =~ s/\s+/ /g;

      my @temp = split(" ", $x);
      $words{$poet} += $#temp + 1;
      foreach my $i (@temp)
      {
        # body...
        local $b = $poet." ".$i;
        $count{$b}++;
      }
    }
  }

  close $tempfile;
  return;
}

sub get_filenames
{
  opendir DIR, $dir or die "cannot open dir $dir: $!";
  @files= readdir DIR;
  closedir DIR;
}


#main
&get_filenames();
foreach my $file (@files)
{
  # body...
  if ($file =~ /.txt/)
  {
    $poet = join ' ', split("_", $file);
    $poet =~ s/.txt//g;
    push @poets, $poet;
    #print "$poet, $file\n";
    &word_frequency($file);
  }
}

# $poet = "Elizabeth Barrett Browning";
# # #print Dumper(\%count);
# my $te = $poet." ".$word;
# print $count{$te};
# #print "$_\n" for keys %count;

foreach my $x (@poets)
{
  # body...
  my $c = $count{$x." ".$word};
  printf "%4d/%6d = %.9f %s\n", $c, $words{$x}, $c/$words{$x}, $x;
}
