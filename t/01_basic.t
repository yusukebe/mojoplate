use Mojo::Base -base;
use Test::More;

use_ok 'Mojoplate';

subtest 'version' => sub {
    ok $Mojoplate::VERSION;
    diag $Mojoplate::VERSION;
};

done_testing();
