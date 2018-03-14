#!/bin/bash
# GetMalIPData script - checks IPVoid.com for a given IP address.
# Scripted by Douglas Berdeaux 2018
#
IFS=$'\n'
printf "\e[1m\e[32mGetMalIPData - 2018 WeakNet Labs\e[0m\n\n"
if [ "$1" != "" ]
 then
  for status in $(curl -s -d ip=$1 --url 'http://www.ipvoid.com/ip-blacklist-check/' |\
   grep -i 'webiron.com' |\
   sed -re 's/<i class="fa fa-minus-circle text-danger" aria-hidden="true"><\/i>/\n[ FAILED ]:/g'|\
   sed -re 's/<i class="fa fa-check-circle text-success" aria-hidden="true"><\/i>/\n[ OK ]:/g'|\
   sed -re 's/<.+href="/ /'|sed -re 's/http.*//g')
  do
   printf "$status\n";
  done;
else
 printf "Usage: ./getmalurldata.sh <ip>\n";
 exit 1;
fi
