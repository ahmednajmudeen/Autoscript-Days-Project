#!/bin/bash
clear
figlet "  AUTOSCRIPT.NET" | lolcat
echo -e "$(tput setaf 8)#By Days-Project <?>  {BETA}$(tput sgr 0)"
echo -e "-------------------------------------------------------------------------------------" | lolcat
echo -e " <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <> " | lolcat
echo -e "-------------------------------------------------------------------------------------" | lolcat
echo -e ""
echo -e ""
echo -e "                                    -=PANEL SSTP=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "             1.  Create Account SSTP"
echo -e "                                               3.  Renew SSTP Account"
echo -e "             2.  Delete SSTP Account"
echo -e "                                               4.  Check User Login SSTP"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                           [x]$(tput setaf 1)  EXIT$(tput sgr 0)    |     [b]$(tput setaf 35)  BACK$(tput sgr 0)"
echo -e ""
read -p "       What do you want :  " port
echo -e ""
case $port in
1)
add-sstp
;;
2)
del-sstp
;;
3)
renew-sstp
;;
4)
cek-sstp
;;
b)
menu
;;
x)
sudo -i
;;
*)
echo -e "       $(tput setaf 1) Please enter a correct number! $(tput sgr 0)"
sleep 3
sstp
;;
esac
