package Phormat::Web;
use strict;
use Dancer;
use Phormat;

get '/' => sub {
    'App name: ' . config->{appname};
};

dance;