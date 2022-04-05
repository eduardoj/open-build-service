#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 1;


use FindBin;
use lib "$FindBin::Bin/lib/";

use Test::Mock::BSConfig;
use Test::Mock::BSRPC;


@::ARGV = ('--testcase');
require_ok('./bs_worker');

$BSConfig::bsdir = "$FindBin::Bin/data/1000";

my $buildinfo = {
  srcserver => $BSConfig::srcserver,
  project   => 'project1',
  package   => 'package1',
  srcmd5    => '1234123412341234',
};

$Test::Mock::BSRPC::fixtures_map = {
  'srcserver/getsources?project=project1&package=package1&srcmd5=1234123412341234'
    => 'srcserver/getsources',
};

my ($got, $expected);


# Test Case 01
$got = getsources($buildinfo, 'bs_worker');
$expected = '';

is_deeply($got, $expected, 'getsources');
# is_deeply($buildinfo, $expected_buildinfo, 'getsources');

exit 0;
