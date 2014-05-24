use Plack::Builder;
use DDP;

my $app = do 'bin/app.pl';
my $config = Phormat::Web::config();
p $config;
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
        ) ] if $config->{environment} eq 'development';
    $app;
};

