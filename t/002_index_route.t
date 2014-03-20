use Dancer ':tests';
use Dancer::Test;

use Phormat;
use Test::More tests => 2;
use strict;

route_exists [GET => '/'], 'a route handler is defined for /';
response_status_is ['GET' => '/'], 200, 'response status is 200 for /';

1;
