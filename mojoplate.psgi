use Mojo::Base -base;
use Mojo::Home;
use lib Mojo::Home->new->child('lib')->to_string;
use Plack::Builder;
use Mojo::Server::PSGI;
use Mojoplate::Web;

my $psgi = Mojo::Server::PSGI->new( app => Mojoplate::Web->new );
my $app = $psgi->to_psgi_app;

builder {
    enable "Plack::Middleware::Static",
        path => qr!^/(?:favicon\.ico|css|js|image|icon)/!,
        root => './public';
    enable_if { $_[0]->{PATH_INFO} !~ qr{^/(?:favicon\.ico|css|images|js)} }
        "Plack::Middleware::AccessLog", format => "combined";
    enable_if { $ENV{PLACK_ENV} eq 'production' }
        "Plack::Middleware::ReverseProxy";
    $app;
};
