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
echo -e "                                   -=TROJAN MENU=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "             1. Create Trojan Account"
echo -e "                                               3. Renew Trojan Account"
echo -e "             2. Delete Trojan Account"
echo -e "                                               4. Check User Login Trojan"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                              [x]  $(tput setaf 1)Exit$(tput sgr 0)    |    [b]  $(tput setaf 35)Back$(tput sgr 0)"
echo -e ""
read -p "      Choose what do you want :  " port
echo -e ""
case $port in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
4)
cek-tr
;;
b)
menu
;;
x)
sudo -i
;;
*)
echo -e "       $(tput setaf 1)Please enter a correct number!$(tput sgr 0)"
sleep 3
trj
;;
esac
