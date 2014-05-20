use Dancer;
use Phormat;
use Plack::Builder;
use strict;

my $app = sub {
    my $env     = shift;
    my $request = Dancer::Request->new( env => $env );
    Dancer->dance($request);
};

my $phormat = Phormat->new( status => $app->status );

builder {
    enable 'Debug', panels => [
        qw(
            Dancer::App
            Environment
            Dancer::Session
            Memory
            Dancer::Version
            Dancer::Settings
            Parameters
        ) ] if config->{environment} eq 'development';
    $app;
};

