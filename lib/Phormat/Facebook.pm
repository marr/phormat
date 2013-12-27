package Phormat::Facebook;

use Dancer qw(:syntax);
use Dancer::Plugin;
use Dancer::Plugin::Facebook;

setup_fb '/auth/facebook';

hook before => sub {
    debug @_;
    return if request->path =~ m{/auth/facebook/postback};
    if (not session('fb_token')) {
        redirect fb_redirect_url;
    }
};

true;
