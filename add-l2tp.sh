#!/bin/bash
echo -e ""
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
PUBLIC_IP=$(wget -qO- icanhazip.com);
else
PUBLIC_IP=$IP
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "       Username        : " -e VPN_USER
		if [[ "$VPN_USER" = "" ]]; then
		echo "       $(tput setaf 1)Please choose a name!.$(tput sgr 0)"
		sleep 3
		add-l2tp
		fi

		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premium-script/data-user-l2tp | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "       $(tput setaf 1)A client with the specified name was already created, please choose another name.$(tput sgr 0)"
			sleep 3
			add-l2tp
		fi
	done
read -p "       Password        : " VPN_PASSWORD
read -p "       Expired (days)  : " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# Add or update VPN user
cat >> /etc/ppp/chap-secrets <<EOF
"$VPN_USER" l2tpd "$VPN_PASSWORD" *
EOF

VPN_PASSWORD_ENC=$(openssl passwd -1 "$VPN_PASSWORD")
cat >> /etc/ipsec.d/passwd <<EOF
$VPN_USER:$VPN_PASSWORD_ENC:xauth-psk
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-l2tp"
echo -e ""
echo -e ""
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e "    --=L2TP/IPSEC PSK VPN=-"
echo -e "$(tput setaf 8)--------------------------------------------------------------------------------------$(tput sgr 0)"
echo -e "   Server IP    : $PUBLIC_IP"
echo -e "   IPsec PSK    : myvpn"
echo -e "   Username     : $VPN_USER"
echo -e "   Password     : $VPN_PASSWORD"
echo -e "   Expired ON   : $(tput setaf 35)$exp$(tput sgr 0)"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
