#!/bin/bash
echo ""
echo "===========================================";
echo " ";
if [ -e "/root/log-limit.txt" ]; then
echo "User Who Violate The Maximum Limit";
echo "Time - Username - Number of Multilogin"
echo "-------------------------------------";
echo " ";
cat /root/log-limit.txt
else
echo " ";
echo " No user has committed a violation"
fi
echo " ";
echo " ";
echo "===========================================";
echo " ";
