use Plack::Builder;
use Phormat::Web;

my $app = Phormat->new(
    config => Phormat::Web::config
);
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
        ) ] if $app->config->{environment} eq 'development';
    $app;
};

