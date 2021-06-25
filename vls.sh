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
echo -e "                                 -=V2RAY VLESS MENU=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "         1.  Create Vless Websocket Account"
echo -e "                                               3.  Renew Vless Account"
echo -e "         2.  Delete Vless Websocket Account"
echo -e "                                               4.  Check User Login Vless"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                              [x]  $(tput setaf 1)Exit$(tput sgr 0)    |    [b]  $(tput setaf 35)Back$(tput sgr 0)"
echo -e ""
read -p "     Choose what do you want : " port
echo -e ""
case $port in
1)
add-vless
;;
2)
del-vless
;;
3)
renew-vless
;;
4)
cek-vless
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
vls
;;
esac
