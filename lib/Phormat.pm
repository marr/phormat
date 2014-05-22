package Phormat;

# ABSTRACT: serve up your social content easily
use namespace::clean;
use strict;

use DDP;
use Dancer;
use Dancer::Plugin::Ajax;
use Moo;

# set port => 3001;

get '/' => sub {
    'you are home, bud';
};

ajax '/status' => sub {
    '100%';
};

true;
