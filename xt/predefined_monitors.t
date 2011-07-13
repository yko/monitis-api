use lib 't/lib';
use Test::Monitis tests => 1, live => 1;

note 'Action report (predefined_monitors->custom_report)';

my $response = api->predefined_monitors->custom_report(
    type   => 'external',
    period => 'Last30Days'
);

isa_ok $response, 'ARRAY', 'JSON response ok';
