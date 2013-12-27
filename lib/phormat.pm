package Phormat;
use Dancer ':syntax';
use Dancer::Plugin::Facebook;

setup_fb '/auth/facebook';

get '/' => sub {
    var feed => fb->fetch('me/feed');
    var feed_json => to_json( vars 'feed' );
    template 'index';
};

hook 'after' => sub {
    #debug vars 'feed';
};

true;
