#!/bin/bash
touch /var/log/vrrp.log
echo "`date` Route Check: on $1 using $2 status $3 " >> /var/log/vrrp.log

#Set to LAN Interface (one VRRP is running on)
interface=eth5

#set to group number used on VRRP group
group=100

#use different values for primary and secondary routers.
#inactive on primary should be higher than active of seconary.
#eg) Primary active = 200,  Secondary active = 100
#    Primary inactive= 150, Secondary inactive = 50
activepriority=150
inactivepriority=50

WLBStatus=$3
echo $WLBStatus
#start config change
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper begin

if [ $WLBStatus = 'inactive' ]
then
  newpriority=$inactivepriority
elif [ $WLBStatus = 'active' ]
then
  newpriority=$activepriority
fi
echo $newpriority

# change priority
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces ethernet eth5 vrrp vrrp-group 100 priority $newpriority

# now commit the changes
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper commit

# finish configuring
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper end
echo "`date` VRRP Priority = $newpriority " >> /var/log/vrrp.log
