use lib 't/lib';
use Test::Monitis tests => 15, live => 1;

note 'Action report (predefined_monitors->custom_report)';
my $response = api->predefined_monitors->custom_report(
    type   => 'external',
    period => 'Last30Days'
);
isa_ok $response, 'ARRAY', 'JSON response ok';

note 'Action topexternal (predefined_monitors->top_external)';
$response = api->predefined_monitors->top_external;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topcpu (predefined_monitors->top_cpu)';
$response = api->predefined_monitors->top_cpu;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topdrive (predefined_monitors->top_drive)';
$response = api->predefined_monitors->top_drive;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topmemory (predefined_monitors->top_memory)';
$response = api->predefined_monitors->top_memory;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topload1 (predefined_monitors->top_load1)';
$response = api->predefined_monitors->top_load1;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topload5 (predefined_monitors->top_load5)';
$response = api->predefined_monitors->top_load5;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topload15 (predefined_monitors->top_load15)';
$response = api->predefined_monitors->top_load15;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topInternalHTTP (predefined_monitors->top_internal_http)';
$response = api->predefined_monitors->top_internal_http;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topInternalPing (predefined_monitors->top_internal_ping)';
$response = api->predefined_monitors->top_internal_ping;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topTransaction (predefined_monitors->top_transaction)';
$response = api->predefined_monitors->top_transaction;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topFullpage (predefined_monitors->top_fullpage)';
$response = api->predefined_monitors->top_fullpage;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topProcessByCPUUsage (predefined_monitors->top_process_by_cpu_usage)';
$response = api->predefined_monitors->top_process_by_cpu_usage;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topProcessByMemoryUsage (predefined_monitors->top_process_by_memory_usage)';
$response = api->predefined_monitors->top_process_by_memory_usage;
isa_ok $response, 'HASH', 'JSON response ok';

note 'Action topProcessByVirtMemoryUsage (predefined_monitors->top_process_by_virt_memory_usage)';
$response = api->predefined_monitors->top_process_by_virt_memory_usage;
isa_ok $response, 'HASH', 'JSON response ok';