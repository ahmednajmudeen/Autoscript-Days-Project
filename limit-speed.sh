#!/bin/bash
echo -e ""
echo -e ""
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(cat /home/limit)
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
function start () {
echo -e "     Limit Speed All Service"
read -p "     Set maximum download rate (in Kbps): " down
read -p "     Set maximum upload rate (in Kbps): " up
if [[ -z "$down" ]] && [[ -z "$up" ]]; then
echo > /dev/null 2>&1
else
echo "     Start Configuration"
sleep 0.5
wondershaper -a $NIC -d $down -u $up > /dev/null 2>&1
systemctl enable --now wondershaper.service
echo "start" > /home/limit
echo "Done"
fi
}
function stop () {
wondershaper -ca $NIC
systemctl stop wondershaper.service
echo "     Stop Configuration"
sleep 0.5
echo > /home/limit
echo "     Done"
}
if [[ "$cek" = "start" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "  #Limit Bandwidth Speed=-"
echo -e "  -----------------------------------"
echo -e "    Status $sts"
echo -e "  ===================================" | lolcat
echo -e "   {1} Start Limit   {2} Stop Limit"
echo -e ""
echo -e "      {x}. $(tput setaf 1)EXIT$(tput sgr 0)  {b}. $(tput setaf 35)BACK$(tput sgr 0)"
echo -e ""
read -rp "   What do you want  : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
elif [[ "$num" = "b" ]]; then
menu
elif [[ "$num" = "x" ]]; then
sudo -i
else
echo "           $(tput setaf 1) You Entered The Wrong Number $(tput sgr 0)"
fi