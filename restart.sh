#!/bin/bash
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "      [1] Restart All Services"
echo -e "      [2] Restart OpenSSH"
echo -e "      [3] Restart Dropbear"
echo -e "      [4] Restart Stunnel4"
echo -e "      [5] Restart OpenVPN"
echo -e "      [6] Restart Squid"
echo -e "      [7] Restart Nginx"
echo -e "      [8] Restart Badvpn"
echo -e "      [b] Back to menu"
echo -e "      [x] Exit"
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
read -p "    What do you want :  " Restart
echo -e ""
case $Restart in
                1)
                $(tput setaf 35)
                echo -e "      This is take a several minutes, please wait for complete!"
                echo -e ""
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
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
                echo -e ""
                echo -e "         All Services Restarted         $(tput sgr 0) "
                exit
                ;;
                2)
                $(tput setaf 35)
                /etc/init.d/ssh restart
                echo -e "         SSH Service Restarted         $(tput sgr 0)"
                exit
                ;;
                3)
                $(tput setaf 35)
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e "         Dropbear Service Restarted     $(tput sgr 0)"
                exit
                ;;
                4)
                $(tput setaf 35)
                /etc/init.d/stunnel4 restart
                echo -e ""
                echo -e "         Stunnel4 Service Restarted     $(tput sgr 0)"
                exit
                ;;
                5)
                $(tput setaf 35)
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e "         OpenVPN Service Restarted      $(tput sgr 0)"
                ;;
                6)
                $(tput setaf 35)
                /etc/init.d/squid restart
                echo -e ""
                echo -e "         Squid3 Service Restarted       $(tput sgr 0)"
                exit
                ;;
                7)
                $(tput setaf 35)
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "         Nginx Service Restarted        $(tput sgr 0)"
                exit
                ;;
                8)
                $(tput setaf 35)
                echo -e "         This is take a several minutes, please wait for complete!"
                echo -e ""
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
                echo -e ""
                echo -e "         Badvpn  BadVPN Service Restarted   $(tput sgr 0)"
                exit
                ;;
                b)
                menu
                ;;
                x)
                sudo -i
                ;;
                *)
                echo -e "       $(tput setaf 1) Please enter an correct number! $(tput sgr 0)"
                sleep 3
                restart
                ;;
        esac