package Phormat::Auth;
use Dancer ':syntax';
use Dancer::Plugin::Facebook;
use Dancer::Plugin::Phormat;
use Phormat::User;
use strict;

prefix '/auth';
setup_fb '/auth/facebook';

# Facebook

# Github
get '/github' => sub {
    github_authenticate;
};

# Twitter
get '/twitter' => sub {
    twitter_authenticate;
};

get '/logout' => sub {
    session->destroy;
};

true;
