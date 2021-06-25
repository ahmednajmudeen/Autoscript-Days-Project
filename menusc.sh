#!/bin/bash
clear
figlet "  AUTOSCRIPT.DAY" | lolcat
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
echo -e "                              -=THIS ARE MENU !HACKING=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "         1.  Search CreditCard Vuln"
echo -e "                                           4.  Tools SQL-Map"
echo -e "         2.  Tools Defacer"
echo -e "                                           5.  Tools Get Quota Warp CloudFlare"
echo -e "         3.  Tools DDOS"
echo -e "                                           6.  Tools Phising"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo "       {m}  $(tput setaf 35)GO TO MENU VPN SERVICES$( tput sgr 0)    {x}  $(tput setaf 1)EXIT FROM THIS MENU / TERMINAL$(tput sgr 0)"
echo -e ""
read -p "     Choose what do you want :  "  num
echo -e ""

case $num in

1)
clear
bash /bin/script/hacking/tools/cc/card.sh
;;

2)
clear
bash /bin/script/hacking/tools/webdav/dav.sh
;;

3)
echo ""
echo "           Use {CTRL+C} for Cancel!"
echo ""
read -rp "       Insert Target IP      : " ip
read -rp "       Insert Port IP        : " port
read -rp "       Insert Packet {Bytes} : " packet
clear
echo "           $(tput setaf 35)Ready to Attack <$ip:$port> With Send Packet <$packet Bytes>$(tput sgr 0)"
sleep 2
echo ""
echo "           Please jangan salahkan aku jika VPS mu bermasalah, karna tools ini berupa $(tput setaf 1)ILEGAL!$(tput sgr 0)"
echo ""
sleep 7
python2 /bin/script/hacking/tools/ddos/start.py $ip $port $packet
;;

4)
clear
cd /bin/script/hacking/tools/sqlmap/ && ls && echo "" && echo "" && echo " Thats Are Not UpgradAble!"
;;

5)
clear
python /bin/script/hacking/tools/warp/start.py
;;

6)
clear
bash /bin/script/hacking/tools/phising/start.sh
;;

m)
menu
;;

x)
sudo -i
;;

*)
echo -e "       $(tput setaf 1)Please enter an correct number! $(tput sgr 0)"
sleep 3
menusc
;;
esac
