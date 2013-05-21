#!/usr/bin/perl -w
use strict;

use Net::IRR qw( :all );
use Data::Dumper;

# $i->sources('arin');

 #my $host = 'rr.arin.net';

my $host = 'whois.radb.net';
my $i = Net::IRR->connect( host => $host ) 
      or die "can't connect to $host\n";
#$i->sources('arin');
my @routes = $i->get_routes_by_origin("AS30600");
  print "Found " . scalar(@routes) . " IPv4 routes\n";
my @ip6routes = $i->get_ipv6_routes_by_origin("AS30600");

my $rte;
print "+====================+\n";
print "|List of IPv4 Routes |\n";
print "+====================+\n";
  foreach $rte (@routes) {
  printf "|%-20s|\n", $rte;
  print "+--------------------+\n";
  }
print "Found " . scalar(@ip6routes) . " IPv6 routes.\n";
print "+====================+\n";
print "|List of IPv6 Routes |\n";
print "+====================+\n";
foreach $rte (@ip6routes) {
    printf "|%-20s|\n",$rte;
    print "+--------------------+\n";
}
my @search = $i->route_search("199.168.72.0/21");
foreach $rte (@search) {
    print "$rte \n";
}
my $asn;
my @asSet = $i->get_as_set("AS-CMN",1);
print "AS entries in CMN's as-set \"AS-CMN\"\n";
foreach $asn (@asSet) {
    print "$asn\n";
}

