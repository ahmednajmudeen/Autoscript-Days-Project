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
echo -e "                            -=This is menu for Change Port=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "              1. Change Port Stunnel4"
echo -e "                                                 5. Change Port Vless"
echo -e "              2. Change Port OpenVPN"
echo -e "                                                 6. Change Port Trojan"
echo -e "              3. Change Port Wireguard"
echo -e "                                                 7. Change Port Squid"
echo -e "              4. Change Port Vmess"
echo -e "                                                 8. Change Port SSTP"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                       {x}  $(tput setaf 1)EXIT$( tput sgr 0)     |      {b}   $(tput setaf 35)BACK$( tput sgr 0)"
echo -e ""
read -p "      What do you want : " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-wg
;;
4)
port-ws
;;
5)
port-vless
;;
6)
port-tr
;;
7)
port-squid
;;
8)
port-sstp
;;
b)
menu
;;
x)
sudo -i
;;

*)
echo - e "       $(tput setaf 1) Please enter a correct number! $(tput sgr 0)"
sleep 2
change
;;
esac
