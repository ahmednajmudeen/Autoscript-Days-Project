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
echo -e "                                     -=SSH MENU=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "    1.  Create SSH & OpenVPN Account"
echo -e "                                           6.  Show Member SSH & OpenVPN"
echo -e "    2.  Trial Account SSH & OpenVPN"
echo -e "                                           7.  Delete Users Expired SSH & OpenVPN"
echo -e "    3.  Renew SSH & OpenVPN Account"
echo -e "                                           8.  Set Up Autokill SSH"
echo -e "    4.  Delete SSH & OpenVPN Account"
echo -e "                                           9.  Check Users Who Doing Multi Login SSH"
echo -e "    5.  Check User Login SSH & OpenVPN"
echo -e "                                          10.  Restart Service"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                              {x}  $(tput setaf 1)EXIT$(tput sgr 0)    |    {b}  $(tput setaf 35)BACK$(tput sgr 0)"
echo -e ""
read -p "     Choose what do you want : " port
echo -e ""
case $port in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
hapus
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
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
tessh
;;
esac
