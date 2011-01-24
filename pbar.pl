#!/usr/bin/perl
# pbar.pl - Draws a colorized percentage bar for the given values to a shell
#
# Copyright (C) 2010 Joachim "Joe" Stiegler <blablabla@trullowitsch.de>
# 
# This program is free software; you can redistribute it and/or modify it under the terms
# of the GNU General Public License as published by the Free Software Foundation; either
# version 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program;
# if not, see <http://www.gnu.org/licenses/>.
#
# --
# 
# Version: 1.0 - 2010-10-13

use warnings;
use strict;
use Getopt::Std;
use Term::ANSIColor;

getopts ("v:m:dw:");

our ($opt_v, $opt_m, $opt_d, $opt_w);

if ( (!defined($opt_v)) || (!defined($opt_m)) ) {
	die "Usage: $0 -v <value> -m <maxvalue> [-w <width>] [-d]\n\nPossible values are integers like 23 or floats like 23.42\n";
}
else {
	if ($opt_v > $opt_m) {
		die "value can't be bigger than maxvalue.\n";
	}

	my $width = 60;	# Default width

	if (defined($opt_w)) {
		$width = $opt_w;
	}

	my $length = $opt_v / $opt_m * $width;
	
	my $chr = " ";

	if (defined($opt_d)) {
		$chr = chr(183);
	}

	print color 'white on_red';
	
	for (my $i=0; $i<$length; $i++) {
		print $chr;
	}
	
	print color 'white on_blue';
	
	for (my $j=$length; $j<$width; $j++) {
		print $chr;
	}
	
	print color 'reset';
	
	my $pt = $opt_v / $opt_m * 100;
	printf " %.2f%s\n", $pt, "%";
}
