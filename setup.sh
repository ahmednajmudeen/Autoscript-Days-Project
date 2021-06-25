#!/bin/bash
#AutoScript By Days

#Settings ipv6 for disabled & install software requred
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl

#Detect User Root or Not
if [ "${EUID}" -ne 0 ]; then
		echo -e"    $(tput setaf 1)You need to run this script as root!$(tput sgr 0)"
		exit 1
fi

#Detect Openvz
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo -e"    $(tput setaf 1)OpenVZ is not supported!$(tput sgr 0)"
		exit 1
fi

#Detect Installed AutoScript
if [ -f "/etc/v2ray/domain" ]; then
echo -e "        $(tput setaf 1)Script Already Installed!$(tput sgr 0)"
rm -f setup.sh
exit 0
fi
#===================================================================================================================================================
#Starting instalation AutoScript
mkdir /var/lib/premium-script;
clear
echo -e "         STEP 1 Getting Domain and Certificate . . . ."
sleep 2
echo "IP=" >> /var/lib/premium-script/ipvps.conf
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/cf.sh && chmod +x cf.sh && ./cf.sh

#install SSH ovpn
clear
echo -e "         STEP 2 install SSH & OVPN"
sleep 2
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh && rm -f /root/ssh-vpn.sh
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh && rm -f /root/sstp.sh

#install SSR
clear
echo -e "         STEP 3 install SS & SSR"
sleep 2
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh && rm -f /root/ssr.sh
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh && rm -f /root/ss.sh

#install WIREGUARD
clear
echo -e "         STEP 4 install WIREGUARD"
sleep 2
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh && rm -f /root/wg.sh

#install V2RAY
clear
echo -e "         STEP 5 install V2RAY"
sleep 2
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh && rm -f /root/ins-vt.sh

#install L2TP
clear
echo -e "         STEP 6 install L2TP"
sleep 2
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh && rm -f /root/ipsec.sh
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh && rm -f /root/set-br.sh

#install ssh edu
clear
echo -e "         STEP 7 install SSH EDU"
sleep 2
wget https://raw.githubusercontent.com/Days-Project/Autoscript/main/edu.sh && chmod +x edu.sh && ./edu.sh && rm -f /root/edu.sh

#Downloads & Setting fitur hacking
wget -O /usr/bin/days.halo https://raw.githubusercontent.com/Days-Project/Autoscript/main/terminal-authentication.py && chmod +x /usr/bin/days.halo
wget -O /usr/bin/log-exit-terminal https://raw.githubusercontent.com/Days-Project/Autoscript/main/menusc.sh
cd /bin/ && wget https://github.com/Days-Project/Autoscript/raw/main/script.zip && unzip script.zip && rm script.zip

#Configuration wellcome
echo "         Configuration Wellcome From This Script"
sleep 2
cat > /root/.profile <<-END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
clear
echo -e ""
figlet Wellcome Beps | lolcat
sleep 2
neofetch
echo -e ""
echo -e "    Please Call me with write $(tput setaf 35)menu$(tput sgr 0) for show all menu list from this auto script!"
echo -e "    Or maybe . . . you are can use this terminal how you like . whatever"
echo -e "    Enjoy, you can tell my BOSS. she is Days , what are you have her number whatsapp?"
echo -e "    Her Number whatsapp +6287891876989"
echo -e ""
read -rp "    Tell me!  What do you want? " apa
$apa
END
echo "         Success . . . "
sleep 2

#Finishing
clear
echo -e "         Finishing . . . ."
sleep 2
history -c
echo "0.0.1" > /home/ver
#===================================================================================================================================================
clear
echo -e ""
figlet Completed . | lolcat
echo "$(tput setaf 35)Installation has been completed!!$(tput sgr 0)"
sleep 2
clear
echo "            $(tput setaf 35)Information installed your VPS with AutoScript By Days!!$(tput sgr 0)"
echo "====================================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - SSH CDN                 : 2082"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "------------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""
echo "    Reboot in 15 sec"
sleep 15
rm -f /root/setup.sh
reboot
