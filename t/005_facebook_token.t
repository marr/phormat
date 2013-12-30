use strict;
use warnings;

# the order is important
use Phormat;
use Dancer::Test;

my $res = dancer_response GET => '/auth/facebook';
ok(1);
print STDERR $res;
#my $req = 
done_testing;
