#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
IZIN=$( curl http://akses.endka.ga:81/aksesku | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
rm -f setup.sh
exit 0
fi
versi=$(cat /home/ver)
if [[ $versi == 0.0.1 ]]; then
echo "You Have The Latest Version"
exit 0
fi

echo "Start Update"
sleep 1
cd /usr/bin
wget -O menu https://raw.githubusercontent.com/Days-Project/Autoscript/main/menu.sh && chmod +x menu
wget -O usernew https://raw.githubusercontent.com/Days-Project/Autoscript/main/usernew.sh && chmod +x usernew
wget -O trial https://raw.githubusercontent.com/Days-Project/Autoscript/main/trial.sh && chmod +x trial
wget -O change-port https://raw.githubusercontent.com/Days-Project/Autoscript/main/change.sh && chmod +x change-port
wget -O port-ovpn https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-ovpn.sh && chmod +x port-ovpn
wget -O port-ssl https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-ssl.sh && chmod +x port-ssl
wget -O port-wg https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-wg.sh && chmod +x port-wg
wget -O port-tr https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-tr.sh && chmod +x port-tr
wget -O port-sstp https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-sstp.sh && chmod +x port-sstp
wget -O port-squid https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-squid.sh && chmod +x port-squid
wget -O port-ws https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-ws.sh && chmod +x port-ws
wget -O port-vless https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-vless.sh && chmod +x port-vless
wget -O wbmn https://raw.githubusercontent.com/Days-Project/Autoscript/main/webmin.sh && chmod +x wbmn
wget -O xp https://raw.githubusercontent.com/Days-Project/Autoscript/main/xp.sh && chmod +x xp
wget -O limit-speed https://raw.githubusercontent.com/Days-Project/Autoscript/main/limit-speed.sh && chmod +x limit-speed
wget -O add-sstp https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-sstp.sh && chmod +x add-sstp
wget -O add-ws https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-ws.sh && chmod +x add-ws
wget -O add-vless https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-vless.sh && chmod +x add-vless
wget -O add-tr https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-tr.sh && chmod +x add-tr

echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
reboot