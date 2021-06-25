#!/bin/bash
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
	echo ""
	echo "        You have no existing clients!"
	sleep 3
	wss
fi
echo ""
echo " Press CTRL+C to return"
echo " Select the existing client you want to renew"
echo -e "================================================" | lolcat
grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
	if [[ ${CLIENT_NUMBER} == '1' ]]; then
		read -rp "       Select one client [1] : " CLIENT_NUMBER
	else
		read -rp "       Select one client [1-${NUMBER_OF_CLIENTS}] : " CLIENT_NUMBER
	fi
done
echo ""
read -p "       Expired (days)  : " masaaktif
user=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/config.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/none.json
service cron restart
echo ""
echo " VMESS Account Was Successfully Renewed"
echo " ======================================"
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo ""