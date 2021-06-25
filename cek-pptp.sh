#!/bin/bash
echo ""
last | grep ppp | grep still | awk '{print " ",$1," - " $3 }' > /tmp/login-db-pptp.txt;
echo ""
echo "           PPTP VPN User Login";
echo "===========================================";
echo "       Username   -------   IP";
echo "-------------------------------------------";
echo ""
cat /tmp/login-db-pptp.txt
echo ""
echo "===========================================";
echo ""
echo ""