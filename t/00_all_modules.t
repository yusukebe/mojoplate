use strict;
use Test::AllModules;

BEGIN {
    all_ok(
        search_path => 'Mojoplate',
        check => sub {
            my $class = shift;
            eval "use $class;1;";
        },
    );
}
