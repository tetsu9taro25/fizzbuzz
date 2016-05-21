package FileOutput;
use strict;
use warnings;
use utf8;

sub file_output {
  my ($class, @history_data) = @_;

  open(DATAFILE, ">", "FizzBuzzHistory.txt") or die("Error:$!");
  print DATAFILE @history_data;
  close(DATAFILE);

  return;
}

1;
