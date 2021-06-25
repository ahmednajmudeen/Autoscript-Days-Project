#!/bin/bash
# Days-Project
# ==================================================
# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=www.endka.xyz
organizationalunit=www.endka.xyz
commonname=www.endka.xyz
email=admin@endka.xyz

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/Days-Project/Autoscript/main/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

#figlet
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof

clear
# Configuration wellcome
echo "   Configuration Wellcome From This Script"
sleep 3
cat > /root/.profile <<-END
clear
echo -e ""
figlet Wellcome Beps | lolcat
echo -e ""
echo -e ""
echo -e ""
echo -e "    Please Call me with write $(tput setaf 35)menu$(tput sgr 0) for show all menu list from this auto script!"
echo -e "    Or maybe . . . you are can use this terminal how you like . whatever"
echo -e "    Enjoy, you can tell my BOSS. she is Days , what are you have her number whatsapp?"
echo -e "    Her Number whatsapp +6287891876989"
echo -e ""
read -rp "    Tell me!  What do you want?   " apa
echo -e ""
$apa
END
echo "   Success . . . "
sleep 3
clear

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/Days-Project/Autoscript/main/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/Days-Project/Autoscript/main/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw https://raw.githubusercontent.com/Days-Project/Autoscript/main/badvpn-udpgw64 && chmod +x /usr/bin/badvpn-udpgw

sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/Days-Project/Autoscript/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 443
connect = 127.0.0.1:109

[dropbear]
accept = 222
connect = 127.0.0.1:22

[dropbear]
accept = 777
connect = 127.0.0.1:22

[openvpn]
accept = 442
connect = 127.0.0.1:1194

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "        $(tput setaf 1)Please uninstall the previous version first!$(tput sgr 0)"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/Days-Project/Autoscript/main/bannerssh.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# block for user torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

cd /usr/bin
# Download Script
wget -O setings https://raw.githubusercontent.com/Days-Project/Autoscript/main/setings.sh && chmod +x setings
wget -O add-host https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-host.sh && chmod +x add-host
wget -O about https://raw.githubusercontent.com/Days-Project/Autoscript/main/about.sh && chmod +x about
wget -O menu https://raw.githubusercontent.com/Days-Project/Autoscript/main/menu.sh && chmod +x menu
wget -O usernew https://raw.githubusercontent.com/Days-Project/Autoscript/main/usernew.sh && chmod +x usernew
wget -O trial https://raw.githubusercontent.com/Days-Project/Autoscript/main/trial.sh && chmod +x trial
wget -O hapus https://raw.githubusercontent.com/Days-Project/Autoscript/main/hapus.sh && chmod +x hapus
wget -O member https://raw.githubusercontent.com/Days-Project/Autoscript/main/member.sh && chmod +x member
wget -O delete https://raw.githubusercontent.com/Days-Project/Autoscript/main/delete.sh && chmod +x delete
wget -O cek https://raw.githubusercontent.com/Days-Project/Autoscript/main/cek.sh && chmod +x cek
wget -O restart https://raw.githubusercontent.com/Days-Project/Autoscript/main/restart.sh && chmod +x restart
wget -O speedtest https://raw.githubusercontent.com/Days-Project/Autoscript/main/speedtest_cli.py && chmod +x speedtest
wget -O info https://raw.githubusercontent.com/Days-Project/Autoscript/main/info.sh && chmod +x info
wget -O ram https://raw.githubusercontent.com/Days-Project/Autoscript/main/ram.sh && chmod +x ram
wget -O renew https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew.sh && chmod +x renew
wget -O autokill https://raw.githubusercontent.com/Days-Project/Autoscript/main/autokill.sh && chmod +x autokill
wget -O ceklim https://raw.githubusercontent.com/Days-Project/Autoscript/main/ceklim.sh && chmod +x ceklim
wget -O tendang https://raw.githubusercontent.com/Days-Project/Autoscript/main/tendang.sh && chmod +x tendang
wget -O change-port https://raw.githubusercontent.com/Days-Project/Autoscript/main/change.sh && chmod +x change-port
wget -O port-ovpn https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-ovpn.sh && chmod +x port-ovpn
wget -O port-ssl https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-ssl.sh && chmod +x port-ssl
wget -O port-wg https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-wg.sh && chmod +x port-wg
wget -O port-tr https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-tr.sh && chmod +x port-tr
wget -O port-sstp https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-sstp.sh && chmod +x port-sstp
wget -O port-squid https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-squid.sh && chmod +x port-squid
wget -O port-ws https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-ws.sh && chmod +x port-ws
wget -O port-vless https://raw.githubusercontent.com/Days-Project/Autoscript/main/port-vless.sh && chmod +x port-vless
wget -O wbmn https://raw.githubusercontent.com/Days-Project/Autoscript/main/webmin.sh && chmod +x wbmn
wget -O xp https://raw.githubusercontent.com/Days-Project/Autoscript/main/xp.sh && chmod +x xp
wget -O tessh https://raw.githubusercontent.com/Days-Project/Autoscript/main/tessh.sh && chmod +x tessh
wget -O ssstp https://raw.githubusercontent.com/Days-Project/Autoscript/main/ssstp.sh && chmod +x ssstp
wget -O sssr https://raw.githubusercontent.com/Days-Project/Autoscript/main/sssr.sh && chmod +x sssr
wget -O ltp https://raw.githubusercontent.com/Days-Project/Autoscript/main/ltp.sh && chmod +x ltp
wget -O wgg https://raw.githubusercontent.com/Days-Project/Autoscript/main/wgg.sh && chmod +x wgg
wget -O trj https://raw.githubusercontent.com/Days-Project/Autoscript/main/trj.sh && chmod +x trj
wget -O wss https://raw.githubusercontent.com/Days-Project/Autoscript/main/wss.sh && chmod +x wss
wget -O vls https://raw.githubusercontent.com/Days-Project/Autoscript/main/vls.sh && chmod +x vls
wget -O updatee https://raw.githubusercontent.com/Days-Project/Autoscript/main/updatee.sh && chmod +x updatee
wget -O auto-reboot https://raw.githubusercontent.com/Days-Project/Autoscript/main/auto-reboot.sh && chmod +x auto-reboot

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

echo "0 5 * * * root clear-log && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab

# remove unnecessary files
#===============================================================================================================================================
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y

# finishing
#===============================================================================================================================================
cd
clear
echo -e " $(tput setaf 1)This is take a several minutes , Please wait!$(tput sgr 0)"
echo -e ""
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile
clear
