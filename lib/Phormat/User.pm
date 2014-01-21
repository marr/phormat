package Phormat::User;
use Moo::Role;

has email => (
    is => 'rw'
);

has feed => (
    is => 'ro'
);

has gravatar_url => (
    is => 'ro'
);

has photos => (
    is => 'ro'
);

1;
