package main;

use FindBin;
use lib "$FindBin::Bin/lib";

# useless test usage of: sub edit_item : Local Form('/books/edit') ...

use Test::More tests => 3;
use Test::WWW::Mechanize::Catalyst 'TestApp';

my $mech = Test::WWW::Mechanize::Catalyst->new;
my $page = "books/edit_item";
$mech->get_ok( "http://localhost/$page", "GET /$page" );

my $form = $mech->current_form;
ok( $form, "Form found" ) or BAIL_OUT("Can't do anything without a form");

my @inputs = $form->inputs;

# 2 fields from form and 1 submit button
is( scalar(@inputs), 3, "Form has expected number of fields" );
