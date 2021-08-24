package Mojoplate;
use Mojo::Base -base, -signatures;
use Mojo::Home;
use YAML qw//;

our $VERSION = '0.01';

has config => sub {
    my $home = Mojo::Home->new;
    my $mode = $ENV{PLACK_ENV} || 'development';
    my $config = YAML::Load($home->child('config', $mode . '.yml')->slurp);
    $config;
};

1;
