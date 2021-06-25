#!/bin/bash
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/Days-Project/Autoscript/main/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat > /etc/msmtprc <<EOF
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user pradiasangindraswari@gmail.com
from pradiasangindraswari@gmail.com
password ybkehwuifdgvgiiq
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup https://raw.githubusercontent.com/Days-Project/Autoscript/main/autobackup.sh && chmod +x autobackup
wget -O backup https://raw.githubusercontent.com/Days-Project/Autoscript/main/backup.sh && chmod +x backup
wget -O bckp https://raw.githubusercontent.com/Days-Project/Autoscript/main/bckp.sh && chmod +x bckp
wget -O restore https://raw.githubusercontent.com/Days-Project/Autoscript/main/restore.sh && chmod +x restore
wget -O strt https://raw.githubusercontent.com/Days-Project/Autoscript/main/strt.sh && chmod +x strt
wget -O limit-speed https://raw.githubusercontent.com/Days-Project/Autoscript/main/limit-speed.sh && chmod +x limit-speed
cd
rm -f /root/set-br.sh