package t::lib::DancerPlugin;
use strict;
use warnings;

use Dancer2::Plugin;
my $counter = 0;

register set_session => sub {
    my ($dsl, $key, $value) = @_;
    $dsl->session($key, $value);
};

register around_get => sub {
    my $dsl = shift;
    $dsl->get( '/foo/plugin' => sub {
        'foo plugin';
    });
};

register install_hooks => sub {
    my $dsl = shift;
    $dsl->hook( 'before' => sub {
        $dsl->session( before_plugin => ++$counter );
    });
};

register_plugin;
1;
