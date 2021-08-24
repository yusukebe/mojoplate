package Mojoplate::Role::Log;
use Mojo::Base 'Mojoplate', -role, -signatures;
use Mojo::Log;

has 'log' => sub ( $self ) {
    my $log = Mojo::Log->new;
    return $log;
};

1;
