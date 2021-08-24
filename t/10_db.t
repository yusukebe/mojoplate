use Mojo::Base -base;
use Test::More;

use_ok('Mojoplate');
use_ok('Mojoplate::DB');

my $db = Mojoplate::DB->new;
ok $db;

subtest 'setup' => sub {
    my $config = Mojoplate->new->config;
    my $connect_info = $config->{connect_info};
    isa_ok $connect_info, 'ARRAY';
    plan skip_all => 'Skip online db tests';
    $db = Mojoplate::DB->new(
        {
            dsn             => $connect_info->[0],
            username        => $connect_info->[1],
            password        => $connect_info->[2],
        }
    );
    ok $db;
};

subtest 'entry' => sub {
    plan skip_all => 'Skip online db tests';
    my ( $iter, $pager ) = $db->search_with_pager(
        'entry',
        {},
        {
            page        => 1,
            limit       => 3,
            pager_logic => "MySQLFoundRows",
            order_by    => { id => 'desc' }
        }
    );
    ok $iter->count;
    my $entry = $iter->first;
    ok $entry;
    ok $entry->id;
    ok $entry->title;
};

done_testing();
