use Dancer::Test;
use Dancer::Config;
use Phormat;
use strict;

Dancer::Config->load;

route_exists [GET => '/'], 'a route handler is defined for /';
response_status_is ['GET' => '/'], 200, 'response status is 200 for /';

1;
