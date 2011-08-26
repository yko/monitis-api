package Monitis::TopResults;

use warnings;
use strict;
require Carp;

use base 'Monitis';

sub external          { shift->_get_top(topexternal                 => @_) }
sub cpu               { shift->_get_top(topcpu                      => @_) }
sub drive             { shift->_get_top(topdrive                    => @_) }
sub memory            { shift->_get_top(topmemory                   => @_) }
sub load1             { shift->_get_top(topload1                    => @_) }
sub load5             { shift->_get_top(topload5                    => @_) }
sub load15            { shift->_get_top(topload15                   => @_) }
sub internal_http     { shift->_get_top(topInternalHTTP             => @_) }
sub internal_ping     { shift->_get_top(topInternalPing             => @_) }
sub transaction       { shift->_get_top(topTransaction              => @_) }
sub fullpage          { shift->_get_top(topFullpage                 => @_) }
sub cpu_usage         { shift->_get_top(topProcessByCPUUsage        => @_) }
sub memory_usage      { shift->_get_top(topProcessByMemoryUsage     => @_) }
sub virt_memory_usage { shift->_get_top(topProcessByVirtMemoryUsage => @_) }

sub _get_top {
    my ($self, $action, @params) = @_;

    my @mandatory = qw//;
    my @optional  = qw/timezoneoffset limit tag detailedResults/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_get($action => $params);
}

__END__

=head1 NAME

Monitis::TopResults - Monitors Top Results

=head1 SYNOPSIS

    use Monitis::TopResults;

=head1 DESCRIPTION

=head1 ATTRIBUTES

L<Monitis::TopResults> implements following attributes:

=head1 METHODS

L<Monitis::TopResults> implements following methods:

=head2 external cpu drive memory load1 load5 load15 internal_http
=head2 internal_ping transaction fullpage cpu_usage memory_usage
=head2 virt_memory_usage

Those actions are used to get tests' last results.
Read API manual at L<http://monitis.com/api/api.html#getTopResults>
for more information

Optional parameters:

    timezoneoffset
    limit
    tag
    detailedResults

Example response:

    {
        "tags":["test_from_api"],
        "tests":[
            {
                "id":13425,
                "result":0.0,
                "testName":"test_test",
                "status":"NOK",
                "lastCheckTime":"10:26"
            }
        ]
    }

=head1 SEE ALSO

L<Monitis> L<Monitis::Agents>

Official API page: L<http://monitis.com/api/api.html#getTopResults>


=head1 AUTHOR

Yaroslav Korshak  C<< <yko@cpan.org> >>


=head1 LICENCE AND COPYRIGHT

Copyright (C) 2006-2011, Monitis Inc.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
