#!/bin/bash

#Author :  GOVIND KUMAR
RED='\033[31m'
RESET='\033[0m'

logo=$(cat <<'EOF'
   __ _          _     _
  / _(_)        | |   (_)
 | |_ _ _ __ ___| |_   _ _ __
 |  _| | '__/ __| __| | | '_ \
 | | | | |  \__ | |_  | | |_) |
 |_| |_|_|  |___/\__| |_| .__/
                        | |
                        |_|
NMAP X OWN SCRIPT(GOVIND KUMAR)
EOF
)

type_effect() {
    local text="$1"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
    done
    echo
}

echo -e "${RED}"
type_effect "$logo"
echo -e "${RESET}"

usage() {
        echo "bash $0 <IP> -T -sV  "
echo " -T ==> T2,T3,T4"
echo "default port scan 1024 :)"
exit 1

}
#test given ip or not

if [ "$#" -eq 0 ]; then
      usage
fi

#tool available or not

if [ -e $"/usr/bin/nmap" ]; then
      echo " ==>Tool available nmap :)"
else
echo "==> Tool not available wait.. tool down. start"
sleep  4s
apt install nmap -y
fi



while getopts  "t:v:h" opt; do
      case "$opt" in
          t)
       threads=$OPTARG
         ;;
         v)
       version=$OPTARG
          ;;
          h)
         help=$OPTARG
          ;;
         *)
          usage
          ;;
esac
done
if [ -z "$1" ]; then
    echo "Error: IP address is required."
    usage
fi

IP="$1"

nmap $@  $threads  $version

echo "==> scan is done by $USER"
