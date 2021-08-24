package Mojoplate::Role::DB;
use Mojo::Base 'Mojoplate', -role, -signatures;
use Mojoplate::DB;

has db => sub ( $self ) {
    my $config = $self->config;
    my $connect_info = $config->{connect_info};
    my $db = Mojoplate::DB->new(
        {
            dsn             => $connect_info->[0],
            username        => $connect_info->[1],
            password        => $connect_info->[2],
            connect_options => +{
                RaiseError => 1,
                PrintError => 0,
                AutoCommit => 1,
            },
        }
    );
    return $db;
};

1;
