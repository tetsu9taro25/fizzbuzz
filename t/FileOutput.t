use strict;
use warnings;
use utf8;
use Test::More;
use Test::Output;
use FileOutput;

binmode Test::More->builder->$_, ":utf8" for qw/output failure_output todo_output/;
no warnings 'redefine';
my $code = \&Test::Builder::child;
*Test::Builder::child = sub {
    my $builder = $code->(@_);
    binmode $builder->output,         ":utf8";
    binmode $builder->failure_output, ":utf8";
    binmode $builder->todo_output,    ":utf8";
    return $builder;
};

subtest 'ファイル出力' => sub {

  my @input = (
    '1,1',
    '2,2',
    '3,Fizz',
    '4,4',
    '5,Buzz'
  );

  FileOutput->file_output(@input);

  open(IN,"FizzBuzzHistory.txt") or die("Error:$!");
  my @file_data = <IN>;
  close(IN);

  is ( @input, @file_data );
};

done_testing;
