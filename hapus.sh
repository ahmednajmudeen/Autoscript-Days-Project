#!/bin/bash
echo -e ""
member
echo -e ""
echo -e "    $(tput setaf 1)Use {CTRL+C}for cancel!$(tput sgr 0)"
echo -e ""
read -p "    Username SSH to Delete  : " Pengguna
echo -e ""
if [[ "$Pengguna" = "" ]]; then
      echo -e "    $(tput setaf 1)Please Enter a Name!$(tput sgr 0)"
      sleep 2
      hapus
elif getent passwd $Pengguna > /dev/null 2>&1; then
echo -e ""
userdel $Pengguna
echo -e ""
echo -e "    $(tput setaf 1)User $Pengguna was removed. $(tput sgr 0)"
sleep 2
member
else
echo -e "    $(tput setaf 1)Failure User $Pengguna is Not Exist. $(tput sgr 0)"
sleep 2
hapus
fi
echo " "
