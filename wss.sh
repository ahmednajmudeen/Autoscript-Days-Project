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
echo -e "                                   -=V2RAY VMESS MENU=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "        1.  Create Vmess Websocket Account"
echo -e "                                                 3.  Renew Vmess Account"
echo -e "        2.  Delete Vmess Websocket Account"
echo -e "                                                 4.  Check User Login Vmess"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                              [x]  $(tput setaf 1)EXIT$(tput sgr 0)    |    [b]  $(tput setaf 35)BACK$(tput sgr 0)"
echo -e ""
read -p "     Choose what do you want :  " port
echo -e ""
case $port in
1)
add-ws
;;
2)
del-ws
;;
3)
renew-ws
;;
4)
cek-ws
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
wss
;;
esac
