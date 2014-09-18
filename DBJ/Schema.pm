package DBJ::Schema;
use Teng::Schema::Declare;
use Encode;

  table {
    name 'user';
    pk 'id';
    columns qw ( id food_id);
  };


  table {
    name 'food';
    pk 'id';
    columns qw ( id name);
    inflate qr/name/ => sub{
        my ($col) = @_;
        decode_utf8($col);
    };
  };

1;
