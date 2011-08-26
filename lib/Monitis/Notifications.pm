package Monitis::Notifications;

use warnings;
use strict;
require Carp;

use base 'Monitis';

sub add {
    my ($self, @params) = @_;

    my @mandatory = qw/monitorId period notifyBackup continuousAlerts
      failureCount monitorType comparingMethod/;
    my @optional = qw/weekdayFrom weekdayTo timeFrom timeTo contactGroup
      contactId paramName paramValue/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_post(addNotificationRule => $params);
}

sub get {
    my ($self, @params) = @_;

    my @mandatory = qw/monitorId monitorType/;
    my @optional  = qw//;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_post(getNotificationRules => $params);
}

sub delete {
    my ($self, @params) = @_;

    my @mandatory = qw/monitorId monitorType contactIds/;
    my @optional  = qw//;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_post(deleteNotificationRule => $params);
}

__END__

=head1 NAME

Monitis::Notifications - Monitors Top Results

=head1 SYNOPSIS

    use Monitis::Notifications;

=head1 DESCRIPTION

=head1 ATTRIBUTES

L<Monitis::Notifications> allows you to manage monitor - contact pairs

=head1 METHODS

L<Monitis::Notifications> implements following methods:

=head2 add

Add notification rule

Mandatory parameters:

    monitorId
    period
    notifyBackup
    continuousAlerts
    failureCount
    monitorType

Optional parameters:

    weekdayFrom
    weekdayTo
    timeFrom
    timeTo
    contactGroup
    contactId
    paramName
    paramValue

=head2 get

Get notification info

Mandatory parameters:

    monitorId
    monitorType

=head2 delete

Delete notification info

Mandatory parameters:

    monitorId
    monitorType
    contactIds

=head1 SEE ALSO

L<Monitis>

Official API page: L<http://monitis.com/api/api.html#addNotification>


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
