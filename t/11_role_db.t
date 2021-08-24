use Mojo::Base -base;
use Test::More;

use_ok('Mojoplate::Role::DB');

package Mojoplate::WithDB {
    use Mojo::Base 'Mojoplate';
    use Role::Tiny::With;
    with 'Mojoplate::Role::DB';
};

my $d = Mojoplate::WithDB->new();
ok $d;

subtest 'db' => sub {
    plan skip_all => 'Skip online db tests';
    my $db = $d->db;
    ok $db;
    isa_ok $db, 'Mojoplate::DB';
};

done_testing();
