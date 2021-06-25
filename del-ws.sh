#!/bin/bash
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo ""
                echo "       You have no existing clients!"
                sleep 2
		wss
        fi
        echo ""
        echo " Press CTRL+C to return"
        echo " Select the existing client you want to remove"
        echo " =============================================" | lolcat
        echo ""
        grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/none.json
rm -f /etc/v2ray/$user-tls.json /etc/v2ray/$user-none.json
systemctl restart v2ray
systemctl restart v2ray@none
echo -e ""
echo -e "   Vmess account successfully deleted"
echo -e "   =================================="
echo -e "   Client Name : $VPN_USER"
echo -e "   Expired On  : $exp"
echo -e ""
