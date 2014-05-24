#!/usr/bin/env perl
use Dancer;
use Phormat::Web;
use Plack::Builder;
debug config->{environment};
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
    dance;
};

