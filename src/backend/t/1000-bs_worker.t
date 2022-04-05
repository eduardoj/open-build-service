#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 2;


use FindBin;
use lib "$FindBin::Bin/lib/";

use Test::Mock::BSConfig;
use Test::Mock::BSRPC;


@::ARGV = ('--testcase');
require_ok('./bs_worker');

$BSConfig::bsdir = "$FindBin::Bin/data/1000";

my $buildinfo = {
  srcserver  => $BSConfig::srcserver,
  project    => 'project1',
  package    => 'package1',
  srcmd5     => '1234123412341234',
  verifymd5  => 'd41d8cd98f00b204e9800998ecf8427e',
};

$Test::Mock::BSRPC::fixtures_map = {
  "srcserver/getsources?project=project1&package=package1&srcmd5=$buildinfo->{srcmd5}"
    => 'srcserver/getsources',
};

my ($got, $expected);


# Test Case 01
($got) = getsources($buildinfo, $BSConfig::bsdir.'/bs_worker');
$expected = 'd41d8cd98f00b204e9800998ecf8427e  package1';
is_deeply($got, $expected, 'Return value of getsources');
use Data::Dumper;
print Dumper($buildinfo);
#$expected = 'd41d8cd98f00b204e9800998ecf8427e  package1';
#is_deeply($buildinfo, $expected_buildinfo, 'Modified buildinfo after calling getsources');

exit 0;
