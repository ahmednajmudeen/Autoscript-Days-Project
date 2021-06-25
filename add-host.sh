echo -e ""
echo -e ""
read -rp "   !> Domain : " -e host
if [[ "$host" = "" ]]; then
	echo " "
	echo "   $(tput setaf 1)Please Field a domain!.$(tput sgr 0)"
	sleep 2
	add-host
else
echo "$host" >> /var/lib/premium-script/ipvps.conf
sleep 2
echo -e ""
echo -e "   $(tput setaf 35)Success to add domain $host for ip vps $IP_PUBLIC $( tput sgr 0)"
echo -e ""
echo -e "   Cek your host DOMAIN in directory ( /var/lib/premium-script/ipvps.conf )"
echo -e ""
fi
