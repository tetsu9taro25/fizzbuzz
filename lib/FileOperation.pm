package FileOperation;
use strict;
use warnings;
use utf8;
use History;

#sub new {
#  my ($class, $filename) = @_;
#  $filename = "FizzBuzzHistory.txt" unless defined $filename ;
#  return bless {
#    filename => $filename;
#  }, $class;
#}

sub file_output {
  my ($class, $histories_instance) = @_;

  open(DATAFILE, ">", "FizzBuzzHistory.txt") or die("Error:$!");

  for($histories_instance->get){
    print DATAFILE $_ . "\n";
  };
  close(DATAFILE);
}

sub file_input {
  my ($class) = @_;

  open(IN, "<", "FizzBuzzHistory.txt") or die("Error:$!");
  my @file_data;
  while(<IN>) {
    chomp($_);
    push(@file_data,$_);
  }
  close(IN);

  return @file_data;
}

1;
