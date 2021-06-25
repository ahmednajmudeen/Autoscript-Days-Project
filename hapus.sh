#!/bin/bash
echo -e ""
member
echo -e ""
echo -e "    $(tput setaf 1)Use {CTRL+C}for cancel!$(tput sgr 0)"
echo -e ""
read -p "    Username SSH to Delete  : " Pengguna
echo -e ""

if getent passwd $Pengguna > /dev/null 2>&1; then
echo -e ""
userdel $Pengguna
echo -e ""
echo -e "    $(tput setaf 1)User $Pengguna was removed. $(tput sgr 0)"
else
echo -e "    $(tput setaf 1)Failure User $Pengguna is Not Exist. $(tput sgr 0)"
fi
echo " "
sleep 3
hapus