#!/bin/bash
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
echo -e "==========================================" | lolcat
echo -e "    [1]  Change Port Vmess TLS $tls"
echo -e "    [2]  Change Port Vmess None TLS $none"
echo -e "    [b]  Back To Menu"
echo -e "    [x]  Exit"
echo -e ""
read -p "        Select From Options [1-2 or x] :  " prot
echo -e ""
case $prot in
1)
read -p "        New Port Vmess TLS: " tls1
echo -e ""
if [ -z $tls1 ]; then
echo -e "        Please Input Port!"
sleep 3
port-ws
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/v2ray/config.json
sed -i "s/   - V2RAY Vmess TLS         : $tls/   - V2RAY Vmess TLS         : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray > /dev/null
echo -e "       \e[032;1mPort $tls1 modified successfully\e[0m"
else
echo -e "       Port $tls1 is used!"
sleep 3
port-ws
fi
;;
2)
echo -e "       Input Only 2 Character (eg : 69)"
read -p "       New Port Vmess None TLS : " none1
echo -e ""
if [ -z $none1 ]; then
echo -e "       Please Input Port"
sleep 3
port-ws
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/v2ray/none.json
sed -i "s/   - V2RAY Vmess None TLS    : $none/   - V2RAY Vmess None TLS    : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray@none > /dev/null
echo -e "       \e[032;1mPort $none1 modified successfully\e[0m"
else
echo -e "       Port $none1 is used!"
sleep 3
port-ws
fi
;;
x)
exit
menu
;;
*)
echo -e "       $(tput setaf 1) Please enter an correct number! $(tput sgr 0)"
sleep 3
port-ws
;;
esac
