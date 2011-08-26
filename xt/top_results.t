use lib 't/lib';

use Test::Monitis agent => 1, tests => 56;

note 'Testing top_results';

my @actions = qw/external cpu drive memory load1 load5 load15 internal_http
  internal_ping transaction fullpage cpu_usage memory_usage
  virt_memory_usage/;

for my $action (@actions) {
    note "Testing method '$action'";
    my $response = api->top_results->$action(
        timezoneoffset => '+3',
        limit          => 10
    );
    isa_ok $response, 'HASH';
    ok exists $response->{tags};
    ok exists $response->{tests};
    isa_ok $response->{tests}, 'ARRAY';
}
