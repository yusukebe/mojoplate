use Mojo::Base -base;
use Test::More;

use_ok('Mojoplate::API');

my $api = Mojoplate::API->new;
ok $api;

done_testing;
