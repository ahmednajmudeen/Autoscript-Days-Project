#!/bin/bash
clear
figlet "  AUTOSCRIPT.NET" | lolcat
echo -e "$(tput setaf 8)#By Days-Project <?>{beta}<?>$(tput sgr 0)"
echo -e "---------------------------------------------------------------------------------------" | lolcat
echo -e "  <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <>  " | lolcat
echo -e "---------------------------------------------------------------------------------------" | lolcat
echo -e ""
echo -e ""
echo -e "                                   -=LIST SSR VPN=-                                   "
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "       1.  Create SSR Account"
echo -e "                                            5.  Renew SSR Account Active"
echo -e "       2.  Create Shadowsocks Account"
echo -e "                                            6.  Renew Shadowsocks Active"
echo -e "       3.  Delete SSR Account"
echo -e "                                            7.  Check User Login Shadowsocks"
echo -e "       4.  Delete Shadowsocks Account"
echo -e "                                            8.  Show Other SSR Menu"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                              {x}  $(tput setaf 1)EXIT$(tput sgr 0)    |    {b}  $(tput setaf 35)BACK$(tput sgr 0)"
echo -e ""
read -p "       What do you want :  " port
echo -e ""
case $port in
1)
add-ssr
;;
2)
add-ss
;;
3)
del-ssr
;;
4)
del-ss
;;
5)
renew-ssr
;;
6)
renew-ss
;;
7)
cek-ss
;;
8)
ssr
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
sssr
;;
esac
