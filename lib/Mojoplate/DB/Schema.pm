package Mojoplate::DB::Schema;
use DBIx::Skinny::Schema;

install_table entry => schema {
    pk 'id';
    columns qw/
        id
        title
    /;
};

1;
