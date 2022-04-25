#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 1;


@::ARGV = ('--testcase');
require_ok('./bs_signer');
