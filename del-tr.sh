#!/bin/bash
echo ""
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "      You have no existing clients!"
		exit 1
	fi
	echo ""
	echo "  Press CTRL+C to return"
	echo "  Select the existing client you want to remove"
	echo " =============================================="
	echo ""
	grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	echo ""
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "    Select one client [1] : " CLIENT_NUMBER
		else
			read -rp "    Select one client [1-${NUMBER_OF_CLIENTS}] : " CLIENT_NUMBER
		fi
	done
CLIENT_NAME=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/d" /etc/trojan/akun.conf
sed -i '/^,"'"$user"'"$/d' /etc/trojan/config.json
systemctl restart trojan
service cron restart
echo -e ""
echo -e ""
echo -e "  Account Trojan Successfully Deleted"
echo -e "  ==================================="
echo -e "  Client Name : $user"
echo -e "  Expired On  : $exp"
echo -e ""