package Phormat::Role::OAuth2Client;
use Moo::Role;

has 'id' => (
    is => 'ro'
);

has 'secret' => (
    is => 'ro'
);

1;
