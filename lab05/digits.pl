#!/usr/bin/perl -w

use strict;
use Try::Tiny;
use Scalar::Util qw(reftype);

# my $line = "";
# while (<STDIN>){
#   $line = <STDIN>;
# }
# print $line;

my @lines;
while (<STDIN>){
  /\S/ or last; # last line if empty
  push @lines, $_;

}

#print @line;

foreach my $line (@lines) {
  # body...


my @chars = split("", $line);
#print @chars;

for my $i (0 .. $#chars)
 {
   #print $i;

  #  try {
  #       die "foo";
  #     } catch {
  #       warn "caught error: $_";
  #     };
  my $t = $chars[$i];

   if ((ord($t) lt "58") && (ord($t) gt "47"))
   {
     if ($t lt "5"){
       print "<";
     }
     elsif ($t gt "5"){
       print ">";
     }
     else{
       print $t;
     }
   }
   else{
     print "$chars[$i]";
   }

   #print "\n";
 }
}
