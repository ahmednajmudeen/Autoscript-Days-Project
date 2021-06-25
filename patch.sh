#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
		echo "    You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

echo "Start Patch"
sleep 1
echo "Fix Curl IP Address"
sleep 1

cd /usr/bin
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
wget -O add-ws https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-ws.sh && chmod +x add-ws
wget -O add-vless https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-vless.sh && chmod +x add-vless
wget -O add-tr https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-tr.sh && chmod +x add-tr
wget -O del-ws https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-ws.sh && chmod +x del-ws
wget -O del-vless https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-vless.sh && chmod +x del-vless
wget -O del-tr https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-tr.sh && chmod +x del-tr
wget -O cek-ws https://raw.githubusercontent.com/Days-Project/Autoscript/main/cek-ws.sh && chmod +x cek-ws
wget -O cek-vless https://raw.githubusercontent.com/Days-Project/Autoscript/main/cek-vless.sh && chmod +x cek-vless
wget -O cek-tr https://raw.githubusercontent.com/Days-Project/Autoscript/main/cek-tr.sh && chmod +x cek-tr
wget -O renew-ws https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-ws.sh && chmod +x renew-ws
wget -O renew-vless https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-vless.sh && chmod +x renew-vless
wget -O renew-tr https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-tr.sh && chmod +x renew-tr
wget -O certv2ray https://raw.githubusercontent.com/Days-Project/Autoscript/main/certv2ray.sh && chmod +x certv2ray
wget -O autobackup https://raw.githubusercontent.com/Days-Project/Autoscript/main/autobackup.sh && chmod +x autobackup
wget -O backup https://raw.githubusercontent.com/Days-Project/Autoscript/main/backup.sh && chmod +x backup
wget -O bckp https://raw.githubusercontent.com/Days-Project/Autoscript/main/bckp.sh && chmod +x bckp
wget -O restore https://raw.githubusercontent.com/Days-Project/Autoscript/main/restore.sh && chmod +x restore
wget -O strt https://raw.githubusercontent.com/Days-Project/Autoscript/main/strt.sh && chmod +x strt
wget -O limit-speed https://raw.githubusercontent.com/Days-Project/Autoscript/main/limit-speed.sh && chmod +x limit-speed
wget -O add-ss https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-ss.sh && chmod +x add-ss
wget -O del-ss https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-ss.sh && chmod +x del-ss
wget -O cek-ss https://raw.githubusercontent.com/Days-Project/Autoscript/main/cek-ss.sh && chmod +x cek-ss
wget -O renew-ss https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-ss.sh && chmod +x renew-ss
wget -O add-wg https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-wg.sh && chmod +x add-wg
wget -O del-wg https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-wg.sh && chmod +x del-wg
wget -O cek-wg https://raw.githubusercontent.com/Days-Project/Autoscript/main/cek-wg.sh && chmod +x cek-wg
wget -O renew-wg https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-wg.sh && chmod +x renew-wg
wget -O add-l2tp https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-l2tp.sh && chmod +x add-l2tp
wget -O del-l2tp https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-l2tp.sh && chmod +x del-l2tp
wget -O add-pptp https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-pptp.sh && chmod +x add-pptp
wget -O del-pptp https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-pptp.sh && chmod +x del-pptp
wget -O renew-pptp https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-pptp.sh && chmod +x renew-pptp
wget -O renew-l2tp https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-l2tp.sh && chmod +x renew-l2tp
wget -O ssr https://raw.githubusercontent.com/Days-Project/Autoscript/main/ssrmu.sh && chmod +x ssr
wget -O add-ssr https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-ssr.sh && chmod +x add-ssr
wget -O del-ssr https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-ssr.sh && chmod +x del-ssr
wget -O renew-ssr https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-ssr.sh && chmod +x renew-ssr
wget -O add-sstp https://raw.githubusercontent.com/Days-Project/Autoscript/main/add-sstp.sh && chmod +x add-sstp
wget -O del-sstp https://raw.githubusercontent.com/Days-Project/Autoscript/main/del-sstp.sh && chmod +x del-sstp
wget -O cek-sstp https://raw.githubusercontent.com/Days-Project/Autoscript/main/cek-sstp.sh && chmod +x cek-sstp
wget -O renew-sstp https://raw.githubusercontent.com/Days-Project/Autoscript/main/renew-sstp.sh && chmod +x renew-sstp

echo "Done Patch"
rm -f patch.sh
