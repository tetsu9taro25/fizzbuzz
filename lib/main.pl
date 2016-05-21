use strict;
use warnings;
use utf8;
use ExitProgram;
use FizzBuzz;
use History;
use FileOutput;
use FileInput;

my @history_data;
my $mode;

while(1) {

  print "Enter the number of the mode : ";
  $mode = <STDIN>;

  if ($mode == 0) {
    print "Exit program.\n";
    ExitProgram->exit_program;
  }

  if ($mode == 1) {
    print "Enter the number for FizzBuzz game.\n";
    my $fb_input = <STDIN>;
    chomp($fb_input);
    my $fb_result = FizzBuzz->result($fb_input) . "\n";
    @history_data = History->save($fb_input, $fb_result, @history_data);
    print $fb_result;
  }

  if ($mode == 2) {
    print "History of this term.\n--------\n";
    print @history_data;
    print "--------\n";
  }

  if ($mode == 3) {
    FileOutput->file_output(@history_data);
    print "FizzBuzzHistory.txt is saved.\n";
  }

  if ($mode == 4) {
    print "History from FizzBuzzHistory.txt.\n--------\n";
    print FileInput->file_input;
    print "--------\n";
  }
}
