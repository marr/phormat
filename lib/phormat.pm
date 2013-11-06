package phormat;
use Dancer ':syntax';

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

post '/:token' => sub {
    template 'app', { token => param 'token' };
};

true;
