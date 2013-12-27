use Test::More;
use strict;
use warnings;

use Dancer::Test;
use Phormat;

my $res = dancer_response (GET => '/user.json', {
    headers => [{ 'X-Requested-With' => 'XMLHttpRequest'}]
});

is $res->{status}, 200, 'user.json';
diag $res->{content};

done_testing;
