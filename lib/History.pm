package History;
use strict;
use warnings;
use utf8;

sub save {
  my $self = shift;
  my $fb_input = shift;
  my $fb_result = shift;
  my @history_data = @_;

  return push(@history_data, ($fb_input . "," . $fb_result));
}

1;
