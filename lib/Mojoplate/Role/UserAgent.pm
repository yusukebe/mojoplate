package Mojoplate::Role::UserAgent;
use Mojo::Base -role, -signatures;
use Mojoplate;
use Mojo::UserAgent;

has 'agent_name' => "Mojoplate::UserAgent/" . $Mojoplate::VERSION;
has 'timeout' => 20;

has 'ua' => sub ($self) {
    my $ua = Mojo::UserAgent->new;
    $ua->transactor->name($self->agent_name);
    $ua->connect_timeout($self->timeout);
    return $ua;
};

1;
