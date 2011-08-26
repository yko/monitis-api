use strict;
use warnings;

use lib 't/lib';
use Test::Monitis live => 1;

note 'Add test Custom Monitor';

my $response = api->custom_monitors->add(
    resultParams => 'position:Position:N/A:2;difference:Difference:N/A:3;',
    name         => 'simple_custom_monitor#' . int(rand(1000)),
    tag          => 'test'
);

my $id = $response->{data};

$response = api->contacts->add(
    group       => 'test group',
    firstName   => 'Jon',
    lastName    => 'Doe',
    account     => '3153473' . int(rand(1000)),
    contactType => '3',                           # ICQ
    timezone    => '-300'
);

my $contact = $response->{data}{contactId};

plan skip_all => "Custom monitor required for this test"
  unless $id && $contact;

plan tests => 4;

$response = api->notifications->add(
    monitorId        => $id,
    period           => 'always',
    notifyBackup     => 1,
    continuousAlerts => 1,
    failureCount     => 1,
    monitorType      => "custom",
    contactId        => $contact,
    paramName        => 'position',
    paramValue       => 1,
    comparingMethod  => 'equals'
);

is $response->{status}, 'ok';

note 'Action getNotificationRules (notification->get)';

$response = api->notifications->get(
    monitorId   => $id,
    monitorType => "custom"
);

TODO: {
    local $TODO = "Bug in API. Will be fixed soon";
SKIP: {
    isa_ok $response, 'ARRAY' or skip "Wrong response", 1;
    like $response->[0]->{monitorId}, qr/^\d+$/;
};
}

$response = api->notifications->delete(
    monitorId   => $id,
    monitorType => "custom", contactIds => $contact
);

is $response->{status}, 'ok';

END {
    # Cleanup
    api->custom_monitors->delete(monitorId => $id) if $id;
    api->contacts->delete(contactId => $contact) if $contact
}
