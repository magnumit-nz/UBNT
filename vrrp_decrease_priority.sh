#!/bin/bash
######
#2017 Mark Gillette
#This script decreases VRRP priority
#script lives in /config/scripts on the edgerouter, use filezilla to transfer.
######

# start modifying config
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper begin

# decrease priority
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper delete interfaces ethernet eth2 vrrp vrrp-group 200 priority
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces ethernet eth2 vrrp vrrp-group 200 priority 10

/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper delete interfaces ethernet eth5 vrrp vrrp-group 100 priority
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces ethernet eth5 vrrp vrrp-group 100 priority 10

# now commit the changes
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper commit

# finish configuring
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper end
