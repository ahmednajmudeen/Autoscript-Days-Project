#!/bin/bash
clear
figlet "  AUTOSCRIPT.NET" | lolcat
echo -e "$(tput setaf 8)#By Days-Project <?>  {BETA}$(tput sgr 0)"
echo -e "-------------------------------------------------------------------------------------" | lolcat
echo -e " <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <> " | lolcat
echo -e "-------------------------------------------------------------------------------------" | lolcat
echo -e ""
echo -e ""
echo -e ""
echo -e "                                    -=L2TP & PPTP=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "            1.  Create L2TP Account"
echo -e "                                             5.  Check User Login PPTP"
echo -e "            2.  Create Account PPTP"
echo -e "                                             6.  Renew L2TP Account"
echo -e "            3.  Delete L2TP Account"
echo -e "                                             7.  Renew PPTP Account"
echo -e "            4.  Delete PPTP Account"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                              [x]  $(tput setaf 1)EXIT$(tput sgr 0)    |    [b]  $(tput setaf 35)BACK$(tput sgr 0)"
echo -e ""
read -p "      What do you want :  " port
echo -e ""
case $port in
1)
add-l2tp
;;
2)
add-pptp
;;
3)
del-l2tp
;;
4)
del-pptp
;;
5)
cek-pptp
;;
6)
renew-l2tp
;;
7)
renew-pptp
;;
b)
menu
;;
x)
sudo -i
;;
*)
echo -e "       $(tput setaf 1) Please enter an correct number! $(tput sgr 0)"
sleep 3
ltp
;;
esac
