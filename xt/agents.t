use lib 't/lib';
use Test::Monitis tests => 7, live => 1;

note 'Action agents (agents->get)';

my $response = api->agents->get;
isa_ok $response, 'ARRAY', 'JSON response ok';

SKIP: {
    skip 'No Monitis aggents found!', 5 unless @$response;
    my $agent_id  = $response->[0]->{id};
    my $agent_key = $response->[0]->{key};

    note 'Action agentInfo (agents->get_agent_info)';

    $response = api->agents->get_agent_info(agentId => $agent_id);
    isa_ok $response, 'HASH', 'JSON response ok';

    note 'Action allAgentsSnapshot (agents->get_all_agents_snapshot)';

    $response = api->agents->get_all_agents_snapshot;
    isa_ok $response, 'HASH', 'JSON response ok';
    isa_ok $response->{agents}, 'ARRAY', 'agents array ok';

    note 'Action agentSnapshot (agents->get_agents_snapshot)';

    $response = api->agents->get_agents_snapshot(agentKey => $agent_key);
    isa_ok $response, 'HASH', 'JSON response ok';

    note 'Action deleteAgents (agents->delete)';

  SKIP: {
        unless ($ENV{MONITIS_DELETE_AGENT}) {

            skip 'Set MONITIS_DELETE_AGENT variable to test agent deletion',
              2;
        }
        $response = api->agents->delete(agentIds => $agent_id);

        isa_ok $response, 'HASH', 'JSON response ok';
        is $response->{status}, 'ok', 'status ok';
    }
}
