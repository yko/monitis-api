require Test::More;
eval "use Test::Perl::Critic -profile => 't/perlcriticrc'";
if ($@) {
    warn $@;
    Test::More::plan(
        skip_all => "Test::Perl::Critic required for testing PBP compliance");
}

Test::Perl::Critic::all_critic_ok();
