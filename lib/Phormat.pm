package Phormat;

use DDP;
use Dancer;
use Moo;
use namespace::clean;

# ABSTRACT: serve up your social content easily
has status => (
    is => 'ro'
);

get '/status' => sub {
    print '100%';
};

sub new {
    my $env     = shift;
    my $request = Dancer::Request->new( env => $env );
    Dancer->dance($request);
    p $env;
};

1;
