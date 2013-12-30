use Test::More tests => 2;
use strict;
use warnings;

# the order is important
use Phormat;
use Dancer::Test;

route_exists [GET => '/auth/facebook'], 'a route handler is defined for /auth/facebook';
response_status_is ['GET' => '/auth/facebook'], 303, 'response status is 303 for /auth/facebook';
