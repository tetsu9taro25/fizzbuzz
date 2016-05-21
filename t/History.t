use strict;
use warnings;
use utf8;
use Test::More;
use Test::Output;
use History;

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

subtest '入力した配列の値が、結果として出力されているか' => sub {

  my @history_before = (
    "1,1",
    "2,2",
    "3,Fizz",
    "4,4"
  );

  my @history_after = (
    "1,1",
    "2,2",
    "3,Fizz",
    "4,4",
    "5,Buzz"
  );

  is ( History->save(5,"Buzz",@history_before), @history_after);
};

done_testing;
