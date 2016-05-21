package FileInput;
use strict;
use warnings;
use utf8;

sub file_input {
  my ($class) = @_;

  open(IN,"FizzBuzzHistory.txt") or die("Error:$!");
  my @file_data = <IN>;
  close(IN);

  return @file_data;
}

1;
