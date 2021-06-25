from getpass import getpass
import os
import time

def menu():
      while True:
           os.system("clear")
           print('  \033[1;36;40m<───────────────────── PASSWORD REQUIRED FROM THIS TERMINAL ─────────────────────>')
           print('\033[1;93m')
           os.system('date +"        Date : %A, %d %B %Y"')
           os.system('date +"        Time : %T WIB"')
           print("\033[1;93m")
           try:
                e = getpass('    \033[1;92mPassword \033[1;93m: ')
                print ("")
                if e=="mdaihasbunallah":
                   print('              { Password is accepted }')
                   time.sleep(2)
                   os.system('clear')
                   print("")
                   os.system('figlet -f slant "WELLCOME DAYS"| lolcat')
                   os.system('echo -e " Please wait for getting moment" | lolcat')
                   time.sleep(3)
                   os.system("bash /usr/bin/menusc")
                else:
                      print("")
                      print("\033[1;91m              {  Wrong Password, Please Try Again }")
                      time.sleep(2)
           except Exception:
                      
                      print("")
                      print("\033[1;91m              { Wrong Password }")
                      time.sleep(2)
           except KeyboardInterrupt:
                      print("")
                      os.system('killall -9 com.termux')
                      os.system('clear')
                      print("")
                      print("")
                      print("")
                      print("\033[1;91m         Password authentication required BOBS!")
                      time.sleep(2)
menu()
