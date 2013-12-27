use Test::More tests => 4;
use strict;
use warnings;

# the order is important
use Phormat;
use Dancer::Test;

route_exists [GET => '/auth/facebook'], 'a route handler is defined for /auth/facebook';
response_status_is ['GET' => '/auth/facebook'], 303, 'response status is 303 for /auth/facebook';

route_exists [GET => '/auth/github'], 'a route handler is defined for /auth/github';
response_status_is ['GET' => '/auth/github'], 303, 'response status is 303 for /auth/github';

done_testing;
