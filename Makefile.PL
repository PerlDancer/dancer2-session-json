use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Dancer 2 session storage in files with JSON",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Dancer2-Session-JSON",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "Dancer2::Session::JSON",
  "PREREQ_PM" => {
    "Dancer2" => "0.200000",
    "Dancer2::Core::Role::SessionFactory::File" => 0,
    "Dancer2::Core::Types" => 0,
    "JSON" => 0,
    "Moo" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Dancer2" => "0.200000",
    "ExtUtils::MakeMaker" => 0,
    "File::Basename" => 0,
    "File::Spec" => 0,
    "HTTP::Cookies" => 0,
    "HTTP::Request::Common" => 0,
    "Plack::Test" => 0,
    "Test::More" => 0,
    "YAML" => 0
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Dancer2" => "0.200000",
  "Dancer2::Core::Role::SessionFactory::File" => 0,
  "Dancer2::Core::Types" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Basename" => 0,
  "File::Spec" => 0,
  "HTTP::Cookies" => 0,
  "HTTP::Request::Common" => 0,
  "JSON" => 0,
  "Moo" => 0,
  "Plack::Test" => 0,
  "Test::More" => 0,
  "YAML" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
