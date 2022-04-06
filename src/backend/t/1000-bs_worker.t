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

my @tc = ( 
  {
  srcserver  => $BSConfig::srcserver,
  project    => 'project1',
  package    => 'package1',
  srcmd5     => '1234123412341234',
  verifymd5  => 'd41d8cd98f00b204e9800998ecf8427e',
  }
);

$Test::Mock::BSRPC::fixtures_map = {
  "srcserver/getsources?project=$tc[0]->{project}&package=$tc[0]->{package}&srcmd5=$tc[0]->{srcmd5}"
    => 'srcserver/getsources',
};
$Test::Mock::BSRPC::directory_map = {
  "srcserver/getsources?project=$tc[0]->{project}&package=$tc[0]->{package}&srcmd5=$tc[0]->{srcmd5}"
    => "$BSConfig::bsdir/srcserver",
};

my ($got, $expected);


# Test Case 01
($got) = getsources($tc[0], "srcserver/getsources?project=$tc[0]->{project}&package=$tc[0]->{package}&srcmd5=$tc[0]->{srcmd5}");
$expected = "$tc[0]->{verifymd5}  $tc[0]->{package}";
is_deeply($got, $expected, 'Return value of getsources');

exit 0;
