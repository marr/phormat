use Test::More;

is $ENV{"$_"}, $_, "$_ env var set"
    foreach qw(http_proxy https_proxy);

done_testing();

