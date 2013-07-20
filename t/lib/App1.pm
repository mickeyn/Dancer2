package t::lib::App1;
use strict;
use warnings;

use Dancer2;
use t::lib::DancerPlugin;

install_hooks;

get '/app1' => sub {
    session 'before_plugin';
};

get '/reset' => sub {
    set_session before_plugin => 0;
    session 'before_plugin';
};

1;

