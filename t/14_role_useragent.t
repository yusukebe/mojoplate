use strict;
use Test::More;

BEGIN {
    use_ok('Mojoplate::Role::UserAgent');
}

package Mojoplate::WithUA {
    use Mojo::Base -base;
    use Role::Tiny::With;
    with 'Mojoplate::Role::UserAgent';
};

my $i = Mojoplate::WithUA->new();
ok $i;

subtest 'ua' => sub {
    my $ua = $i->ua;
    ok $ua;
    isa_ok $ua, 'Mojo::UserAgent';
    ok $ua->transactor->name;
};

done_testing();
