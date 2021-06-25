#!/bin/bash
apt install jq curl -y
clear
echo -e "    $(tput setaf 35)DaysVPN FORM SUBDOMAIN$(tput sgr 0)"
echo -e ""
echo -e "       We provide 2 domains for you, including : nezavpn.com  &  vmess.my.id"
echo -e "       Please choose your like!"
echo -e ""
echo -e "       1. Request your sub with domain nezavpn.com"
echo -e "       2. Request your sub with domain vmess.my.id"
echo -e "       3. {random}.nezavpn.com"
echo -e "       4. {random}.vmess.my.id"
echo -e ""
read -rp "          Choose : " choose
if [[ "$choose" = "1" ]]; then
	DOMAIN=nezavpn.com
	CF_ID=muhammad.neizam@gmail.com
	CF_KEY=10da726480584a601ecc58b12621f0b0102ec
	read -rp "     Request sub : " req
	SUB_DOMAIN=${req}.nezavpn.com

elif [[ "$choose" = "2" ]]; then
	DOMAIN=vmess.my.id
	CF_ID=pradiasangindraswari@gmail.com
	CF_KEY=75b54a5c9fd50751003abac0fefee534528c0
	read -rp "     Request sub : " req
	SUB_DOMAIN=${req}.vmess.my.id

elif [[ "$choose" = "3" ]]; then
	DOMAIN=nezavpn.com
	CF_ID=muhammad.neizam@gmail.com
	CF_KEY=10da726480584a601ecc58b12621f0b0102ec
	sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
	SUB_DOMAIN=${sub}.nezavpn.com

elif [[ "$choose" = "4" ]]; then
	DOMAIN=vmess.my.id
	CF_ID=pradiasangindraswari@gmail.com
	CF_KEY=75b54a5c9fd50751003abac0fefee534528c0
	sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
	SUB_DOMAIN=${sub}.vmess.my.id

fi

set -euo pipefail
IP=$(wget -qO- ipinfo.io/ip);
echo "      $(tput setaf 35)Updating DNS for ${SUB_DOMAIN}...$(tput sgr 0)"
sleep 5
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo " "
echo "       Host : $SUB_DOMAIN"
echo $SUB_DOMAIN > /root/domain
echo "       in folder /etc/v2ray/domain"
sleep 5
clear
rm -f /root/cf.sh
