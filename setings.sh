#!/bin/bash
clear
echo -e ""
echo -e ""
echo -e "═════════════════════════════════════════" | lolcat
echo -e "|           -=Manage Your VPS=-         |"
echo -e "═════════════════════════════════════════" | lolcat
echo -e "     1.  Add Subdomain Host For VPS"
echo -e "     2.  Renew Certificate V2RAY"
echo -e "     3.  Change Port VPN Services"
echo -e "     4.  Set Autobackup VPS"
echo -e "     5.  Backup Data VPS"
echo -e "     6.  Restore Data VPS"
echo -e "     7.  Webmin Manager"
echo -e "     8.  Limit Bandwith Speed Server"
echo -e "     9.  Check Usage of VPS Ram"
echo -e "    10.  Reboot VPS"
echo -e "    11.  Speedtest VPS"
echo -e "    12.  Information AutoScript"
echo -e "    13.  OUR About AutoScript"
echo -e "    14.  Restart All Service"
echo -e "    15.  Set Auto Reboot"
echo -e "    16.  Set Multi Login Services"
echo -e "    17.  Change Your Password VPS"
echo -e "    18.  UPDATE AUTOSCRIPT"
echo -e ""
echo -e "\e[32m════════════════════════════════════════\e[m"
echo -e ""
echo -e "         {b}   $(tput setaf 35)Back to Menu$(tput sgr 0)"
echo -e "         {x}   $(tput setaf 1)Exit$(tput sgr 0)"
echo -e ""
echo -e "\e[32m════════════════════════════════════════\e[m"
echo -e ""
read -p "     What do you want :  "  num
echo -e ""
case $num in
1)
add-host
;;
2)
certv2ray
;;
3)
change-port
;;
4)
autobackup
;;
5)
backup
;;
6)
restore
;;
7)
wbmn
;;
8)
limit-speed
;;
9)
ram
;;
10)
reboot
;;
11)
speedtest
;;
12)
info
;;
13)
about
;;
14)
restart
;;
15)
auto-reboot
;;
16)
autokill
;;
17)
passwd
;;
18)
echo -e "    Wait For Update Automatically by server, for this time No update service"
echo -e ""
;;
b)
menu
;;
x)
sudo -i
;;
*)
echo "    $(tput setaf 1)Please enter a correct number!$(tput sgr 0)"
sleep 3
setings
;;
esac
