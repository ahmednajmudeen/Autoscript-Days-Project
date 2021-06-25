#!/bin/bash
echo ""
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/premium-script/data-user-sstp")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "       You have no existing clients!"
		sleep 2
		ssstp
	fi
	echo ""
	echo "   Press CTRL+C to return"
	echo "   Select the existing client you want to remove"
	echo " ==============================================="
	echo ""
	grep -E "^### " "/var/lib/premium-script/data-user-sstp" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			echo ""
			read -rp "    Select one client [1] : " CLIENT_NUMBER
		else
			echo ""
			read -rp "    Select one client [1-${NUMBER_OF_CLIENTS}] : " CLIENT_NUMBER
		fi
	done
Client=$(grep -E "^###" /var/lib/premium-script/data-user-sstp | cut -d ' ' -f 2-3 | sed -n "$CLIENT_NUMBER"p)
user=$(grep -E "^###" /var/lib/premium-script/data-user-sstp | cut -d ' ' -f 2 | sed -n "$CLIENT_NUMBER"p)
exp=$(grep -E "^###" /var/lib/premium-script/data-user-sstp | cut -d ' ' -f 3 | sed -n "$CLIENT_NUMBER"p)
sed -i "/^### $user $exp/d" /var/lib/premium-script/data-user-sstp
sed -i '/^'"$user"'/d' /home/sstp/sstp_account
echo -e ""
echo -e "      Client Name $user Account SSTP Successfully Deleted"
echo -e ""
