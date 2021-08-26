use Mojo::Base -base;
use Test::More;
use Redis;

use_ok('Mojoplate::Cache');

subtest 'redis' => sub {
    plan skip_all => 'Skip online cache tests';
    my $redis = Redis->new();
    my $cache = Mojoplate::Cache->new( store => $redis );
    ok $cache;
    $cache->set( 'hoge', 'foo' );
    my $hoge = $cache->get('hoge');
    is $hoge, 'foo';
    $cache->del('hoge');
    $hoge = $cache->get('hoge');
    ok !$hoge;
};

done_testing();
