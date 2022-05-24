#!/usr/bin/env bash
bs_dir="$(dirname $(readlink -f $0))"

#terminal colors
COLOR_NC=$(tput sgr0)
export COLOR_NC
COLOR_RED=$(tput setaf 1)
export COLOR_RED
COLOR_GREEN=$(tput setaf 2)
export COLOR_GREEN
COLOR_YELLOW=$(tput setaf 3)
export COLOR_YELLOW
COLOR_BLUE=$(tput setaf 4)
export COLOR_BLUE




 echo -e "\n\n${COLOR_YELLOW}Installing dependencies...${COLOR_NC}\n\n"
 # sudo apt install -y build-essential curl
 sudo apt install -y libcurl4-openssl-dev pkg-config libtool ocl-icd-* opencl-headers



echo -e "\n\n${COLOR_YELLOW}Compiling cgminer....${COLOR_NC}\n\n"
"$bs_dir"/autogen.sh
CFLAGS="-O2 -Wall -march=native"
"$bs_dir"/configure --enable-opencl
make



printf "
Original by BIT90
"
echo -e "\n\n${COLOR_GREEN}CGMINER successfully installed!!${COLOR_NC}"
echo -e "\n\n${COLOR_GREEN}For Troubleshooting visit https://help.novopool.net${COLOR_NC}"
echo -e "\n\n${COLOR_GREEN}RUN CGMINER using the following command${COLOR_NC}"
echo -e "${COLOR_YELLOW}- ./cgminer -o stratum+tcp://m2.novopool.net:3333 -u pubkey.workername -p pubkey ${COLOR_NC}\n"
