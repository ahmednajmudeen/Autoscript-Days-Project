#!/bin/bash
echo ""
echo ""
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
echo -e "=======================================" | lolcat
echo -e "       Change Port SSTP from $sstp"
read -p "       TO New Port sstp : " sstp2
echo -e ""
if [ -z $sstp2 ]; then
echo "       Please Input Port!"
sleep 3
port-sstp
fi
cek=$(netstat -nutlp | grep -w $sstp2)
if [[ -z $cek ]]; then
sed -i "s/$sstp/$sstp2/g" /etc/accel-ppp.conf
sed -i "s/   - SSTP VPN : $sstp/   - SSTP VPN : $sstp2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $sstp -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $sstp -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $sstp2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $sstp2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart accel-ppp> /dev/null
echo -e "       \e[032;1mPort $sstp2 modified successfully\e[0m"
else
echo "       Port $sstp2 is used"
sleep 3
port-sstp
fi

