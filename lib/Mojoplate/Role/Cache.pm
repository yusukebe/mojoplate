package Mojoplate::Role::Cache;
use Mojo::Base -role, -signatures;
use Mojoplate::Cache;
use Digest::SHA1 qw//;
use Storable qw//;
use Compress::Zlib qw//;

has 'cache' => sub {
    Mojoplate::Cache->new;
};

#XXX
has 'redis' => sub ( $self ) {
    $self->cache->store;
};

sub make_key {
    my ( $self, @data ) = @_;
    local $Storable::canonical = 1;
    return Digest::SHA1::sha1_hex( Storable::nfreeze( [@data] ) );
}

1;
