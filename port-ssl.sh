#!/bin/bash
echo ""
echo ""
ssl="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $1}')"
ssl2="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $2}')"
echo -e "=======================================" | lolcat
echo -e "    [1]  Change Port SSL FROM $ssl"
echo -e "    [2]  Change Port SSL FROM $ssl2"
echo -e "    [b]  Back To Menu"
echo -e "    [x]  Exit"
echo -e ""
read -p "        Select From Options  :  " prot
echo -e ""
case $prot in
1)
read -p "        TO New Port Stunnel4 : " stl
if [ -z $stl ]; then
echo "        Please Input Port!"
sleep 3
port-ssl
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4 : $ssl, $ssl2/   - Stunnel4 : $stl, $ssl2/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "       \e[032;1mPort $stl modified successfully\e[0m"
else
echo "       Port $stl is used"
sleep 3
port-ssl
fi
;;
2)
read -p "     New Port Stunnel4: " stl
echo -e ""
if [ -z $stl ]; then
echo "     Please Input Port"
sleep 3
port-ssl
fi
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl2/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $ssl, $ssl2/   - Stunnel4                : $ssl, $stl/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "       \e[032;1mPort $stl modified successfully\e[0m"
else
echo "       Port $stl is used"
sleep 3
port-ssl
fi
;;
b)
menu
;;
x)
sudo -i
;;
*)
echo -e "       $(tput setaf 1)Please enter an correct number! $(tput sgr 0)"
sleep 3
port-ssl
;;
esac
