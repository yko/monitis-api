package Monitis::PredefinedMonitors;

use warnings;
use strict;
require Carp;

use base 'Monitis';

sub custom_report {
    my ($self, @params) = @_;

    my @mandatory = qw/type/;
    my @optional =
      qw/period startDate endDate monitorIds tag chart chartWidth chartHeight/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_get('report' => $params);
}

sub top_external {
    shift->_top_by_type('topexternal', @_);
}

sub top_cpu {
    shift->_top_by_type('topcpu', @_);
}

sub top_drive {
    shift->_top_by_type('topdrive', @_);
}

sub top_memory {
    shift->_top_by_type('topmemory', @_);
}

sub top_load1 {
    shift->_top_by_type('topload1', @_);
}

sub top_load5 {
    shift->_top_by_type('topload5', @_);
}

sub top_load15 {
    shift->_top_by_type('topload15', @_);
}

sub top_internal_http {
    shift->_top_by_type('topInternalHTTP', @_);
}

sub top_internal_ping {
    shift->_top_by_type('topInternalPing', @_);
}

sub top_transaction {
    shift->_top_by_type('topTransaction', @_);
}

sub top_fullpage {
    shift->_top_by_type('topFullpage', @_);
}

sub top_process_by_cpu_usage {
    shift->_top_by_type('topProcessByCPUUsage', @_);
}

sub top_process_by_memory_usage {
    shift->_top_by_type('topProcessByMemoryUsage', @_);
}

sub top_process_by_virt_memory_usage {
    shift->_top_by_type('topProcessByVirtMemoryUsage', @_);
}

sub _top_by_type {
    my ($self, $type, @params) = @_;

    my @mandatory = qw//;
    my @optional  = qw/timezoneoffset limit tag/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    $self->api_get($type => $params);
}

__END__

=head1 NAME

Monitis::PredefinedMonitors - Custom monitors info

=head1 SYNOPSIS

    use Monitis::PredefinedMonitors;

=head1 DESCRIPTION

=head1 ATTRIBUTES

L<Monitis::PredefinedMonitors> implements following attributes:

=head1 METHODS

L<Monitis::PredefinedMonitors> implements following methods:

=head2 custom_report

    my $response = $api->predefined_monitors->custom_report(
        type   => 'memory',
        period => 'Last30Days',
        tag => 'my tag'
    );

Get custom report from predefined monitors.

Mandatory parameters:

    type
    Also required one of parameters: tag or monitorIds

Optional parameters:

    period startDate endDate chart chartWidth chartHeight

Normal response is:

[   {   "agentkey"   => "snmp",
        "testName"   => "memory@snmp",
        "buffered"   => 956,
        "cached"     => 134.81,
        "usedMemory" => 507.72,
        "freeMemory" => 503.28,
        "freeSwap"   => 956,
        "okCount"    => 6831,
        "nokCount"   => 0
    },

    # ...
]


=head1 SEE ALSO

L<Monitis> L<Monitis::Agents>

Official API page: L<http://monitis.com/api/api.html#customReport>


=head1 AUTHOR

Yaroslav Korshak  C<< <ykorshak@gmail.com> >>
Alexandr Babenko  C<< <foxcool@cpan.org> >>


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
