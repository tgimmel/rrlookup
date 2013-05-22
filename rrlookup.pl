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

foreach $rte (@routes) {
my $search = $i->route_search("$rte");
#foreach $rte (@search) {
    print "$search \n";
}    
my $asn;
my @asSet = $i->get_as_set("AS-CMN",1);
print "\n";
print "AS entries in CMN's as-set \"AS-CMN\"\n";
foreach $asn (@asSet) {
    print "$asn\n";
}
my $entry;
@asSet = undef;
@asSet = $i->get_as_set("AS30600:AS-CUSTOMERS",1);
print "\n";
print "Entries in as-set AS30600:AS-CUSTOMERS\n";
  foreach $entry (@asSet) {
    print "$entry \n";
  }
