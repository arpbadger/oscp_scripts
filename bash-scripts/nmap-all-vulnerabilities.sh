#!/bin/bash 

# run all Nmap NSE scripts for vulnerabilities 

# assumes you have a text file of ip addresses called ips.txt
#          to to this, run nmap -sn [target range] -oG ips-full | grep 'Status: Up' | cut -d' ' -f 2 >> ips.txt
# assumes you've places all your NSE vuln scans in a file called vulns.txt
#          to do this, run cd /usr/share/nmap/scripts; ls -l *vulns* >> full-vulns.txt
#                          cat full-vulns.txt | cut -d' ' -f 11 > vulns.txt 

for $vulns in $(cat vulns.txt);do
  for ips in $(cat ips.txt);do
    nmap -v --script=$vulns $ips -oG nmap-all-vulnerabilities.txt;done;done
