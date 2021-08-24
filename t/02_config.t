use Mojo::Base -base;
use Test::More;

use_ok 'Mojoplate';

subtest 'config' => sub {
    my $config = Mojoplate->new->config;
    ok $config;
    is ref $config, 'HASH';
    ok $config->{connect_info};
};

done_testing();
