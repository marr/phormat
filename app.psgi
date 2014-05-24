use Plack::Builder;

my $app = require Phormat::Web;

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
        ) ] if Phormat::Web::config()->{environment} eq 'development';
    $app;
};

