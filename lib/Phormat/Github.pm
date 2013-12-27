package Phormat::Github;
use Dancer ':syntax';
use Data::Dumper;
use Moo;
use strict;
use warnings;

with 'Phormat::User';

has 'client' => (
    is => 'ro',
);
 
hook 'init_phormat' => sub {
    my ($self) = shift;
    debug 'phormat is starting up!';
    debug Dumper @_;
};

true;
