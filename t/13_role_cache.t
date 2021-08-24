use strict;
use Test::More;

BEGIN {
    use_ok('Mojoplate::Role::Cache');
}

package Mojoplate::WithCache {
    use Mojo::Base -base;
    use Role::Tiny::With;
    with 'Mojoplate::Role::Cache';
};

my $i = Mojoplate::WithCache->new();
ok $i;

subtest 'cache' => sub {
    my $cache = $i->cache;
    ok $cache;
    isa_ok $cache, 'Mojoplate::Cache';
};

subtest 'make_key' => sub {
    can_ok($i, 'make_key');
    my $key = $i->make_key('xxx');
    ok $key;
    diag $key;
};

done_testing();
