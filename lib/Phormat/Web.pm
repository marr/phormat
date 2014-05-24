package Phormat::Web;
use strict;
use Dancer;
use Phormat;

my $app = Phormat->new(
    name => 'phormat',
    app => dance
);

get '/' => sub {
    'App name: ' . $app->name;
};

dance;
