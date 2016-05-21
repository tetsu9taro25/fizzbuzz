package FizzBuzz;
use strict;
use warnings;
use utf8;

sub result {
  my ($class, $args) = @_;

  unless($class->_is_integer($args)){
    return 'Please input integer number.';
  }
  if($class->_is_multiple_of_15($args)){
    return 'FizzBuzz';
  }
  if($class->_is_multiple_of_5($args)){
    return 'Buzz';
  }
  if($class->_is_multiple_of_3($args)){
    return 'Fizz';
  }

  return $args;
}

sub _is_multiple_of_15 {
  my ($self, $args) = @_;
  $args % 15 == 0;
}

sub _is_multiple_of_5 {
  my ($self, $args) = @_;
  $args % 5 == 0;
}

sub _is_multiple_of_3 {
  my ($self, $args) = @_;
  $args % 3 == 0;
}

sub _is_integer {
  my ($self, $args) = @_;
  $args =~ /^[+-]?[0-9]+$/;
}

1;
