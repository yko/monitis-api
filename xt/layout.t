use lib 't/lib';
use Test::Monitis tests => 19, live => 1, agent => 1;

my $unique_page_name = 'test page ';

my @chars = split //, 'abcdefgh0123456789';
my $size = rand(15);

for (0 .. $size) {
    $unique_page_name .= uc $chars[rand(scalar @chars)];
}

note 'Action addPage';

my $response = api->layout->add_page(
    title       => $unique_page_name,
    columnCount => 2
);

isa_ok $response, 'HASH', 'JSON response ok';
is $response->{status}, 'ok', 'status ok';
like $response->{data}{pageId}, qr/^\d+$/, 'API returned page id';

my $page_id = $response->{data}{pageId};

note 'Action addPageModule to page #' . $page_id;

# Create dummy CPU monitor
$response = api->cpu->add(
    agentkey  => agent->{key},
    idleMin   => '0',
    ioWaitMax => '100',
    kernelMax => '100',
    niceMax   => '100',
    usedMax   => '100',
    name      => 'test_cpu_monitor',
    tag       => 'test'
);

isa_ok $response, 'HASH', 'JSON response ok';
is $response->{status}, 'ok', 'status ok';
like $response->{data}{testId}, qr/^\d+$/, 'API returned test id';

my $monitor_id = $response->{data}{testId};

SKIP: {
    skip 'Monitor id required for this test', 9 unless $monitor_id;
    $response = api->layout->add_module_to_page(
        moduleName   => 'CPU',
        pageId       => $page_id,
        column       => '1',
        row          => '2',
        dataModuleId => $monitor_id,
        height       => '400'
    );

    isa_ok $response, 'HASH', 'JSON response ok';
    is $response->{status}, 'ok', 'status ok';
    like $response->{data}{pageModuleId}, qr/^\d+$/, 'API returned module id';

    my $module_id = $response->{data}{pageModuleId};

    note 'Action pageModules #' . $page_id;

    $response = api->layout->get_page_modules(pageName => $unique_page_name);

    isa_ok $response, 'ARRAY', 'JSON response ok';

    like $response->[0]{id}, qr/^\d+$/, 'Right ID';

    note 'Action deletePageModule #' . $page_id;
  SKIP: {
        skip 'Module_id required for this test', 2 unless $module_id;

        $response =
          api->layout->delete_page_module(pageModuleId => $module_id);

        isa_ok $response, 'HASH', 'JSON response ok';
        is $response->{status}, 'ok', 'status ok';
    }

    $response =
      api->internal_monitors->delete(testIds => $monitor_id, type => 7);

    isa_ok $response, 'HASH', 'JSON response ok';
    is $response->{status}, 'ok', 'monitor deleted';
}

note 'Action deletePage #' . $page_id;

$response = api->layout->delete_page(pageId => $page_id);

isa_ok $response, 'HASH', 'JSON response ok';
is $response->{status}, 'ok', 'status ok';

note 'Action getPages';

$response = api->layout->get_pages;

isa_ok $response, 'ARRAY', 'JSON response ok';
like $response->[0]{id}, qr/^\d+$/,
  'API returned page id in HASH packed in ARRAY';

