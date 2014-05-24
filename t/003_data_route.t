use Test::More;
use strict;
use warnings;

use Dancer::Test;
use Phormat;

my $res = dancer_response (GET => 'status', {
    headers => [{ 'X-Requested-With' => 'XMLHttpRequest'}]
});

is $res->{status}, 200, 'status was successful';
diag $res->{status};
diag $res->{content};

done_testing;
