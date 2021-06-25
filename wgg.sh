#!/bin/bash
clear
figlet "  AUTOSCRIPT.NET" | lolcat
echo -e "$(tput setaf 8)#By Days-Project <?>{beta}<?>$(tput sgr 0)"
echo -e "---------------------------------------------------------------------------------------" | lolcat
echo -e "  <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <>  " | lolcat
echo -e "---------------------------------------------------------------------------------------" | lolcat
echo -e ""
echo -e ""
echo -e ""
echo -e "                                   -=WIREGUARD MENU=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "          1.  Create Wireguard Account"
echo -e "                                             3.  Check User Login Wireguard"
echo -e "          2.  Delete Wireguard Account"
echo -e "                                             4.  Renew Wireguard Account"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                              {x}  $(tput setaf 1)EXIT$(tput sgr 0)    |    {b}  $(tput setaf 35)BACK$(tput sgr 0)"
echo -e ""
read -p "     Choose what do you want :  " port
echo -e ""
case $port in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
b)
menu
;;
x)
sudo -i
;;
*)
echo "       $(tput setaf 1)Please enter a correct number!$(tput sgr 0)"
sleep 3
wgg
;;
esac
