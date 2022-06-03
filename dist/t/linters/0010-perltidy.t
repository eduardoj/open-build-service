#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use Test::Code::TidyAll;
tidyall_ok(conf_file => '../.tidyallrc');
