package Phormat::User;

use Dancer qw(:syntax);
use Dancer::Plugin::Ajax;

use Moo::Role;
use strict;

hook 'before_template' => sub {
    my $tokens = shift;
    #$tokens->{user} = ph;
};

ajax '/user.json' => sub {
    return to_json([{ }]);
};

1;
