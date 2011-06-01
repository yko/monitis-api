use lib 't/lib';
use Test::Monitis;

plan tests => 1 + scalar(keys %{$Monitis::MAPPING})*2;

my $api = new_ok 'Monitis';

foreach my $pkg (keys %{$Monitis::MAPPING}) {
    ok $api->$pkg(), "mapping $pkg";
    like $api->{_typeof}, qr/\Q$Monitis::MAPPING->{$pkg}\E$/, "mapped $pkg";
}
