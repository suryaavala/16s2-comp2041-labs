#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab05

use strict;
use Try::Tiny;
use Scalar::Util qw(reftype);



my @lines;
while (<STDIN>){
  /\S/ or last; # last line if empty
  push @lines, $_;

}

#print @line;

foreach my $line (@lines) {



my @chars = split("", $line);


for my $i (0 .. $#chars)
 {

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
