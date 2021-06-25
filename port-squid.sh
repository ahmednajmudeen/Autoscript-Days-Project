#!/bin/bash
echo ""
echo ""
sqd="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
sqd2="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | tail -n1)"
echo -e "========================================" | lolcat
echo -e "    [1]  Change Port SQUID from $sqd"
echo -e "    [2]  Change Port SQUID from $sqd2"
echo -e "    [b]  Back To Menu"
echo -e "    [x]  Exit"
echo -e ""
read -p "        Select From Options [1-2 or x] :  " prot
echo -e ""
case $prot in
1)
read -p "       TO New Port Squid : " squid
if [ -z $squid ]; then
echo "       Please Input Port"
sleep 3
port-squid
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "       \e[032;1mPort $squid modified successfully\e[0m"
else
echo "       Port $squid is used"
fi
;;
2)
read -p "       TO New Port Squid : " squid
ecjo -e ""
if [ -z $squid ]; then
echo "       Please Input Port"
sleep 3
port-squid
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd2/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd2/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "       \e[032;1mPort $squid modified successfully\e[0m"
else
echo -e "       Port $squid is used"
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
port-squid
;;
esac

