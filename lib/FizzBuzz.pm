package FizzBuzz;
use strict;
use warnings;
use utf8;
use History;

sub new {
  my ($class, $fb_input) = @_;
  my $fb_result;
  return bless {
    fb_input => $fb_input,
    fb_result => $fb_result,
  }, $class;
}

sub result {
  my ($self, $instance) = @_;
  my $fb_input = $self->{fb_input};
  my $fb_result;

  unless($self->_is_integer($fb_input)){
    $fb_result = 'Please input integer number.';
    return;
  }elsif($self->_is_multiple_of_15($fb_input)){
    $fb_result = 'FizzBuzz';
  }elsif($self->_is_multiple_of_5($fb_input)){
    $fb_result = 'Buzz';
  }elsif($self->_is_multiple_of_3($fb_input)){
    $fb_result = 'Fizz';
  }else{
    $fb_result = $fb_input;
  }

  $self->{fb_result} = $fb_result;
  $instance->save($fb_input,$self->{fb_result});
}

sub show {
  my ($self) = @_;
  print $self->{fb_result} . "\n";
}

#private

sub _is_multiple_of_15 {
  my ($self, $arg) = @_;
  $arg % 15 == 0;
}

sub _is_multiple_of_5 {
  my ($self, $arg) = @_;
  $arg % 5 == 0;
}

sub _is_multiple_of_3 {
  my ($self, $arg) = @_;
  $arg % 3 == 0;
}

sub _is_integer {
  my ($self, $arg) = @_;
  $arg =~ /^[+-]?[0-9]+$/;
}

1;
