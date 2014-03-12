use Test::More tests => 1;
use strict;
use warnings;

# the order is important
use Phormat;
use Dancer::Test;

my $res = dancer_response GET => '/auth/facebook';
ok(ref $res eq 'Dancer::Response');

done_testing;
