#!/bin/bash
clear
figlet "  AUTOSCRIPT.NET" | lolcat
echo -e "$(tput setaf 8)#By Days-Project <?>{beta}<?>$(tput sgr 0)"
echo -e "---------------------------------------------------------------------------------------" | lolcat
echo -e "  <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <>  " | lolcat
echo -e "---------------------------------------------------------------------------------------" | lolcat

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "   Im Sorry, We Are Maintancing This AutoScript for Many Times, Please Wait For NEW Realease!"
	exit
fi
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city)
WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipv4.icanhazip.com)
if [[ /etc/v2ray/domain ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$(/var/lib/premium-script/ipvps.conf)
fi
echo ""
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
echo -e ""
echo -e "                              -=ACCESS LOGIN BY ROOT=-"
echo -e "                    -=THIS IS AN INFORMATION ABOUT YOUR SERVER=-"
echo -e "======================================================================================" | lolcat
echo -e ""
echo -e "    \e[033;1mIP SERVER               :    \e[0m  $IPVPS"
echo -e "    \e[033;1mHOST DOMAIN             :    \e[0m  $domain"
echo -e "    \e[032;1mISP Name                :    \e[0m  $ISP - $CITY"
echo -e "    \e[032;1mCPU Model               :   \e[0m  $cname , $cores cores $freq MHz"
echo -e "    \e[032;1mTotal Amount Of RAM     :    \e[0m  $tram MB"
echo -e "    \e[032;1mSystem Uptime           :   \e[0m  $up"
echo -e ""
echo -e "$(tput setaf 8)--------------------------------------------------------------------------------------$(tput sgr 0)"
echo -e ""
echo -e "                        -=THIS IS MENU LIST BY DAYS PROJECT =-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "         1.  Control Panel SSH & OVPN"
echo -e "                                           5.  Control Panel SSR & Shadowsocks"
echo -e "         2.  Control Panel Wireguard"
echo -e "                                           6.  Control Panel Vmess/V2ray"
echo -e "         3.  Control Panel L2TP & PPTP"
echo -e "                                           7.  Control Panel Vless"
echo -e "         4.  Control Panel SSTP"
echo -e "                                           8.  Control Panel Trojan"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo "       {s}  $(tput setaf 35)SETTING  / MANAGE YOUR VPS$( tput sgr 0)    {x}  $(tput setaf 1)EXIT FROM THIS MENU / TERMINAL$(tput sgr 0)"
echo -e ""
read -p "     Choose what do you want :  "  num
echo -e ""

case $num in

1)
tessh
;;

2)
wgg
;;

3)
ltp
;;

4)
ssstp
;;

5)
sssr
;;

6)
wss
;;

7)
vls
;;

8)
trj
;;

s)
setings
;;

x)
sudo -i
;;

*)
echo -e "       $(tput setaf 1) Please enter an correct number! $(tput sgr 0)"
sleep 3
menu
;;
esac
