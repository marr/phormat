use strict;
use warnings;
use Test::Most;

# the order is important
use Phormat;
use Dancer::Test;

my $res = dancer_response GET => '/auth/facebook';
diag $res->content;
ok(1);

done_testing;
