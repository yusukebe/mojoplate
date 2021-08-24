package Mojoplate::Web;
use Mojo::Base 'Mojolicious', -signatures;
use Mojo::Home;
use Mojo::JSON qw/encode_json/;
use Mojoplate::API;

# This method will run once at server start
sub startup ($self) {

    my $api = Mojoplate::API->new;
    my $config = $api->config;

    # Configure the application
    $self->secrets( $config->{secrets} );

    $self->attr( api => sub { $api } );

    $self->helper(
        hello => sub($self) {
            return 'hello';
        }
    );

    # Router
    my $r = $self->routes;
    $r->get('/')->to('Root#index');
}

1;
