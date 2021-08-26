requires 'Mojolicious';
requires 'Plack';
requires 'Plack::Middleware::AccessLog';
requires 'Plack::Middleware::Static';
requires 'Plack::Middleware::ReverseProxy';
requires 'Role::Tiny';
requires 'YAML';
requires 'Redis';
requires 'DBI';
requires 'DBIx::Skinny';
requires 'DBIx::Skinny::Pager';
requires 'Data::Page::Navigation';
requires 'Digest::SHA1';
requires 'Storable';
requires 'Compress::Zlib';

on test => sub {
    requires 'Test::AllModules';
    requires 'Test::More';
    requires 'Test::Name::FromLine';
};
