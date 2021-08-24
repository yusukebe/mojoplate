package Mojoplate::Cache;
use Mojo::Base -base, -signatures;
use Mojoplate;
use Redis;
use Storable qw//;
use Compress::Zlib qw//;

has 'namespace' => 'Mojoplate::Cache/' . $Mojoplate::VERSION;

has 'store' => sub ($self) {
    Redis->new( name => $self->namespace );
};

has 'default_expires' => sub { 60 * 60 * 24 * 365 };

sub get ($self, $key) {
    my $val = $self->store->get($key);
    return unless $val;
    $val = Compress::Zlib::memGunzip($val);
    $val = Storable::thaw($val);
    my $data = $val->{date};
    $self->store->del($key) unless $data;
    return $data;
}

sub set ($self, $key, $data, $exp = undef) {
    $exp ||= $self->default_expires;
    my $val = Compress::Zlib::memGzip( Storable::nfreeze( { data => $data } ) );
    $self->store->set($key, $val, $exp);
}

sub del ($self, $key) {
    $self->delete($key);
}

sub delete ($self, $key) {
    $self->store->del($key);
}

1;
