
use strict;
use File::Spec;
use CGI::Session::Test::Default;

for ( "DB_File", "FreezeThaw" ) {
    unless ( eval "require $_" ) {
        plan(skip_all=>"$_ is NOT available");
        exit(0);
    }
}

my $t = CGI::Session::Test::Default->new(
    dsn => "driver:DB_File;serializer:FreezeThaw",
    args=>{FileName => File::Spec->catfile('t', 'sessiondata', 'cgisess.db')});

$t->run();