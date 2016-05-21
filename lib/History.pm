package History;
use strict;
use warnings;
use utf8;

sub new {
  my ($class) = @_;
  my @histories;
  return bless {
    histories => \@histories,
  }, $class;
}

sub save {
  my $self = shift;
  my $fb_input = shift;
  my $fb_result = shift;

  return push( @{ $self->{histories} }, ($fb_input . "," . $fb_result));
}

sub get {
  my $self = shift;
  return @{ $self->{histories} };
}

1;
