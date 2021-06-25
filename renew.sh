#!/bin/bash
member
echo -e ""
echo -e ""
read -p "  Username       :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "  Day Extend     :  " Days
echo -e ""
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
echo -e ""
echo -e "  #Extended days for user =-"
echo -e "  ============================================"
echo -e "   Username        :  $User"
echo -e "   Days Added      :  $Days Days"
echo -e "   Expired on      :  $Expiration_Display"
echo -e ""
else
echo -e ""
echo -e "           $(tput setaf 1)Username Doesnt Exist!$(tput sgr 0)       "
echo -e ""
fi