package Dancer::Plugin::Phormat;

use Dancer qw(:syntax);
use Dancer::Plugin;
#use Dancer::Plugin::Database;
use Dancer::Plugin::Auth::Github;
use Dancer::Plugin::Auth::Twitter;
use strict;
use warnings;

auth_github_init();
auth_twitter_init();
#execute_hook 'init_phormat';

register github_authenticate => sub {
    redirect auth_github_authenticate_url;
};

register twitter_authenticate => sub {
    redirect auth_twitter_authenticate_url;
};

register_plugin;

1;
