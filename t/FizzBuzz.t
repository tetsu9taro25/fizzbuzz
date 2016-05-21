use strict;
use warnings;
use utf8;
use Test::More;
use Test::Output;
use FizzBuzz;

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

subtest '3を受け取った場合、Fizzと出力しているか' => sub {
  is ( FizzBuzz->result(3), 'Fizz');
};

subtest '-3を受け取った場合、Fizzと出力しているか' => sub {
  is ( FizzBuzz->result(-3), 'Fizz');
};

subtest '5を受け取った場合、Buzzと出力しているか' => sub {
  is ( FizzBuzz->result(5), 'Buzz');
};

subtest '15を受け取った場合、FizzBuzzのみ出力しているか' => sub {
  is ( FizzBuzz->result(15), 'FizzBuzz');
};

subtest '1を受け取った場合、1をそのまま出力しているか' => sub {
  is ( FizzBuzz->result(1), '1');
};

subtest '-1を受け取った場合、-1をそのまま出力しているか' => sub {
  is ( FizzBuzz->result(-1), '-1');
};

subtest '非整数の0.2を受け取った場合、エラーを返すか' => sub {
  is ( FizzBuzz->result(0.2), 'Please input integer number.');
};

done_testing;
