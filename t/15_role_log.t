use strict;
use Test::More;

BEGIN {
    use_ok('Mojoplate::Role::Log');
}

package Mojoplate::WithLog {
    use Mojo::Base -base;
    use Role::Tiny::With;
    with 'Mojoplate::Role::Log';
};

my $log = Mojoplate::WithLog->new();
ok $log;

done_testing();
