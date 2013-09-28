# ABSTRACT: Core libraries for Dancer2 2.0

package Dancer2::Core;

use strict;
use warnings;

=func camelize

Camelize a underscore-separated-string.

=cut

sub camelize {
    join '' => map { ucfirst } split /_/ => shift;
}


1;
