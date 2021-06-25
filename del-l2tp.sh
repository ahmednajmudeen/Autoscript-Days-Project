#!/bin/bash
echo -e ""
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/premium-script/data-user-l2tp")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "        You have no existing clients!"
		echo ""
		sleep 3
		ltp
	fi
	echo ""
	echo " Press CTRL+C to return"
	echo " Select the existing client you want to remove"
	echo " ============================================="
	echo ""
	grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 2-3 | nl -s ') '
	echo ""
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "       Select One Client [1] : " CLIENT_NUMBER
		else
			read -rp "       Select One Client [1-${NUMBER_OF_CLIENTS}] : " CLIENT_NUMBER
		fi
	done
	# match the selected number to a client name
	VPN_USER=$(grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
# Delete VPN user
sed -i '/^"'"$VPN_USER"'" l2tpd/d' /etc/ppp/chap-secrets
# shellcheck disable=SC2016
sed -i '/^'"$VPN_USER"':\$1\$/d' /etc/ipsec.d/passwd
sed -i "/^### $VPN_USER $exp/d" /var/lib/premium-script/data-user-l2tp
# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
echo -e ""
echo -e "     Client Name $VPN_USER from Account L2TP Successfully Deleted"
echo -e ""
