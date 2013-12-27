package Phormat;
use Dancer;
use Data::Dumper;
use Phormat::Auth;
use Phormat::Github;
use strict;
use warnings;

# ABSTRACT: serve up your social content easily

get '/' => sub {
    #TODO: Show facebook, etc.
    #For all the github_user properties
    #look at http://developer.github.com/v3/users/
    #See the Response for "Get the authenticated user"
    template 'index', {
        #user => ph
    };
};

true;
