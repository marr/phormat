use Plack::Builder;
use Phormat::Web;

my $app = require Phormat;

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
        ) ] if Phormat::Web::config->{environment} eq 'development';
    $app;
};

