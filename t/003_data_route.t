use Test::More tests => 1;
use Data::Dumper;
use strict;
use warnings;

# the order is important
use Phormat;
use Dancer::Test;

my $res = dancer_response GET => '/user.json', {
    headers => [{'X-Requested-With' => 'XMLHttpRequest'}]
};

print STDERR Dumper($res->{content});

ok $res->{content};
