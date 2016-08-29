#!/usr/bin/perl -w
#Surya Avinash Avala, z5096886
#COMP9041 Software Construction, 16s2, lab05
#tail.pl
use strict;
#print @ARGV;
my $nb_args = $#ARGV;
#print $nb_args;
my @files = ();
my @lines;
my $nb_lines = 10;

sub tailing
{
  #takes @lines and $nb_lines as argument
  my @tailed_lines;
  if ($#lines > $nb_lines)
  {
  @tailed_lines = @lines[$#lines-$nb_lines+1..$#lines];

}
else {
  @tailed_lines = @lines[0..$#lines];
}
  print @tailed_lines;
}

if ($nb_args > -1)
{

  foreach my $arg (@ARGV) {
          push @files, $arg;
      }
  #my $temp = $files[0];
  my @temp_chars = split("", $files[0]);
  if ($temp_chars[0] eq "-"){
      $nb_lines = join("", @temp_chars[1..$#temp_chars]);
      #print "$nb_lines\n";
      @files = @files[1..$#files];
  }

  if ($#files == 0){
    open(F,"<$files[0]") or die "./tail.pl: can't open $files[0]\n";
    # process F
    #...
    #print 'there';
    # while (my $line=<F>){
    #   #print 'here';
    #   print "$line";
    # }
    @lines = <F>;
    #print "here\n";
    &tailing();
    close(F);
  }
  else
  {

  foreach my $f (@files) {
      #print "$f\n";

      open(F,"<$f") or die "./tail.pl: can't open $f\n";
      # process F
      #...
      #print 'there';
      # while (my $line=<F>){
      #   #print 'here';
      #   print "$line";
      # }
      @lines = <F>;
      print "==> $f <==\n";
      &tailing();
      close(F);
  }
}
}

else {
  while (<STDIN>){
    /\S/ or last;
    push @lines, $_;
  }
  &tailing();
}


#print @lines;
#&tailing();
#else{
  #read from stdin
#}
