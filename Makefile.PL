use inc::Module::Install;

name 'Monitis';
all_from 'lib/Monitis.pm';
license 'perl';

build_requires 'Test::More';
build_requires 'HTTP::Request';
build_requires 'HTTP::Headers';
build_requires 'HTTP::Request::Common';
build_requires 'Digest::SHA';
build_requires 'JSON';
build_requires 'LWP::UserAgent';

resources
  license    => "http://dev.perl.org/licenses",
  homepage   => "http://monitis.com/api/api.html",
  repository => "https://github.com/monitisexchange/Perl-SDK",

auto_install;

WriteAll;
