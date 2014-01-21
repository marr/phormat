package Phormat;
use Dancer ':syntax';
use Dancer::Plugin::Ajax;
use Dancer::Plugin::Facebook;
use Dancer::Plugin::Auth::Github;

use Phormat::User;

auth_github_init();
setup_fb '/auth/facebook';

get '/' => sub {
    #TODO: Show facebook, etc.
    vars facebook_id => fb->{id};
   "Hello, ".session('github_user')->{'login'};
    #For all the github_user properties
    #look at http://developer.github.com/v3/users/
    #See the Response for "Get the authenticated user"
    template 'index';
};

get '/logout' => sub {
    session->destroy;
};

post '/user' => sub {
    debug params, @_;
};
 
#additionally the plugin adds session('github_access_token')
#so you can use it if you're doing other things with GitHub Api.
 
#by default github authentication failure will redirect to this route
get '/auth/github/failed' => sub { debug 'nope'; return "Github authentication Failed" };

# TODO: Data feeds
ajax '/user.json' => sub {
    return { redirect => '/auth/facebook' } unless session->{fb_token};
    var photos => fb->fetch('me/photos');
    var feed => fb->fetch('me/feed');
    var user => fb->fetch('me');
    to_json( vars );
};

hook 'before' => sub {
    return if request->path =~ m{/auth/github/callback};
    if (not session('github_user')) {
        redirect auth_github_authenticate_url;
    }
    if (not session('facebook_user')) {
        
    }
};

hook 'after' => sub {
    #debug vars 'feed';
};

true;
