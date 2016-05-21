use strict;
use warnings;
use utf8;
use ExitProgram;
use FizzBuzz;
use History;
use FileOperation;

my $mode;
my $history = History->new;

while(1) {

  print "Enter the number of the mode : ";
  $mode = <STDIN>;

  if ($mode == 0) {
    print "Exit program.\n";
    ExitProgram->exit_program;
  }

  if ($mode == 1) {
    print "Enter the number for FizzBuzz game.\n";
    chomp( my $fb_input = <STDIN>);
    my $fb_instance = FizzBuzz->new($fb_input);
    $fb_instance->result($history);
    $fb_instance->show;
  }

  if ($mode == 2) {
    print "History of this term.\n--------\n";
    &print_array($history->get);
    print "--------\n";
  }

  if ($mode == 3) {
    FileOperation->file_output($history);
    print "FizzBuzzHistory.txt is saved.\n";
  }

  if ($mode == 4) {
    print "History from FizzBuzzHistory.txt.\n--------\n";
    &print_array(FileOperation->file_input);
    print "--------\n";
  }
}

sub print_array {
  my @array = @_;
  for(@array){
    print $_ . "\n";
  };
}
