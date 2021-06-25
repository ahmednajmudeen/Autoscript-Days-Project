#!/bin/bash
echo -e ""
echo -e ""
read -p "       Username       : " Login
read -p "       Password       : " Pass
read -p "       Expired (hari) : " masaaktif
domain=$(cat /etc/v2ray/domain)
IP=$(wget -qO- ipinfo.io/ip);
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo -e ""
echo -e "       $(tput setaf 35)Adding account ssh $Login "
echo -e "       Setting Password $Pass $(tput sgr 0)"
sleep 2
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
figlet "  AUTOSCRIPT.NET" | lolcat
echo -e "$(tput setaf 8)#By Days-Project <?>  {BETA}$(tput sgr 0)"
echo -e "-------------------------------------------------------------------------------------" | lolcat
echo -e " <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <> " | lolcat
echo -e "-------------------------------------------------------------------------------------" | lolcat
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e " #Success add user premium SSH & OpenVPN=-"
echo -e "==================================================="
echo -e "  Username       : $Login "
echo -e "  Password       : $Pass"
echo -e "  Expired on     : $(tput setaf 35)$exp$(tput sgr 0)"
echo -e "===================================================" | lolcat
echo -e "  Host IP        : $IP"
echo -e "  Host Domain    : $domain"
echo -e "  CITY           : $CITY"
echo -e "  ISP            : $ISP"
echo -e "  OpenSSH        : 22"
echo -e "  SSH WebSocket  : 2082 ( edukasi )"
echo -e "  Dropbear       : 109, 143"
echo -e "  SSL/TLS        :$ssl"
echo -e "  Port Squid     :$sqd"
echo -e "  BadVPN         : 7100-7300"
echo -e "===================================================" | lolcat
echo -e "OpenVPN : TCP $ovpn http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN : UDP $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN : SSL 442 http://$IP:81/client-tcp-ssl.ovpn"
echo -e "===================================================" | lolcat
echo -e "              -=AutoScript By DaysVPN=-"
echo -e ""
