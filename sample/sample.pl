#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use PDN::Transrator::Vendor;
use PDN::Transrator::Vendor::Supermicro;
use Getopt::Long;

my $product_name;
GetOptions(
	'name=s' => \$product_name,
);

unless ($product_name) {
	usage();
}

sub usage {
	print "$0 -n <ProductName>\n";
	print "Options:\n";
	print "    -n | -name <ProductName>\n";
	print "";
	exit 1;
}

{
	my $product = PDN::Transrator::Vendor::Supermicro->new('product_name' => $product_name);
	print Dumper $product->{specification};
}

