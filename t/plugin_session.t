# plugin_import.t

use strict;
use warnings;
use t::lib::App1;

use Test::More;
use Dancer2::Test apps=>['t::lib::App1'];

{
    package t::lib::App1;
    set session => "Simple";
}

response_content_is '/app1', '1',
  "First call, session value is one";

response_content_is '/app1', '2',
  "Second call, session value is two";

response_content_is '/reset', '0',
  "Reset works";

response_content_is '/app1', '1',
  "Next call is 1";


done_testing;

