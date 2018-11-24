#!/bin/bash 
  
     ip=`ifconfig eth0 | awk '/inet /{print $2}'`
 
     hona=`awk '/'$ip' /{print $2}' /etc/hosts`

     hostnamectl  set-hostname ${hona}
