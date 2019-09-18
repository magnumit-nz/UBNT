#!/bin/bash
######
#2017 Mark Gillette
#This script increases VRRP priority
######

# start modifying config
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper begin

# increase priority
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper delete interfaces ethernet eth2 vrrp vrrp-group 200 priority
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces ethernet eth2 vrrp vrrp-group 200 priority 150

/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper delete interfaces ethernet eth5 vrrp vrrp-group 100 priority
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces ethernet eth5 vrrp vrrp-group 100 priority 100

# now commit the changes
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper commit

# finish configuring
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper end
