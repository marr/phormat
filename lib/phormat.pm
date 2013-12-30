package Phormat;
use Dancer ':syntax';
use Dancer::Plugin::Ajax;
use Dancer::Plugin::Facebook;

setup_fb '/auth/facebook';

get '/' => sub {
    template 'index';
};

ajax '/data.json' => sub {
    my $data = vars 'feed';
    debug $data;
    to_json( $data );
};

hook 'before' => sub {
    if (session->{fb_token}) {
        var feed => fb->fetch('me/feed');
    }
};

hook 'after' => sub {
    #debug vars 'feed';
};

true;
