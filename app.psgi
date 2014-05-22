use Dancer;
use Phormat;
use Plack::Builder;
use strict;

my $app = Phormat->new;
use DDP; p $app;

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
    $app->dance;
};

