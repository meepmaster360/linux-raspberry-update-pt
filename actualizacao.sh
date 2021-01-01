#!/bin/bash
# Autor: meepmaster
# Descrição: Script Automatizado para actualização e limpeza do sistema.
# Teste2
# INICIO
clear

TITLE="Actualização de Sistema de $HOSTNAME"
RIGHT_NOW=$(date +"%x %r %z")
TIME_STAMP="Actualizado $RIGHT_NOW por $USER"

# Padrão de cores para cabeçalhos
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

clear

function Menu () {
	# Função Menu Principal
	clear
	echo -e "*-*-*- ${GREEN}SCRIP BY MEEPMASTER${NOCOLOR} -*-*-*" 
	echo -e "*-*-*- ${GREEN}UPDATE & UPGRADE${NOCOLOR} -*-*-*" 
	echo
	echo -e " [1] ${GREEN}Update e Upgrade do Sistema${NOCOLOR} "
	echo -e " [2] ${GREEN}RPI-Upgrade ${RED}(Só no Raspberry Raspi)${NOCOLOR} "
	echo -e " [3] ${GREEN}Instalação de Software Essencial${NOCOLOR} "
	echo -e " [4] ${GREEN}Dados do Sistema${NOCOLOR} "
	echo -e " [5] ${GREEN}Adicionar Usuário ao Sistema${NOCOLOR} "
	echo -e " [6] ${GREEN}Remover Usuário no Sistema${NOCOLOR} "
	echo -e " [0] ${GREEN}Sair${NOCOLOR} "
	echo

	echo -n -e " ${GREEN}>>> Digite a Opção:${NOCOLOR} "
	read opcao

	case $opcao in
	 1) Update_upgrade 
	;;
	 2) RPI_Upgrade 	
	;;
	 3) Essencial 
	;;
	 4) Sistema 
	;;
	 5) Adicionar 
	;;
	 6) Remover
	;;
	 0) Sair 
	;;
	 *) "Opção Inválida." ; echo ; Menu ;;
	esac
}


function Update_upgrade () {
	# Update e Upgrade do sistema
	echo -e "${GREEN}Inicio de Actualização.${NOCOLOR}"
	echo
	sudo dpkg --configure -a
	sudo apt-get install -f
	sudo apt update --fix-missing
	sudo apt-get upgrade -y
	sudo apt full-upgrade -y
	sudo apt-get dist-upgrade -y
	echo
	echo -e "${GREEN}Update e Upgrade concluído.${NOCOLOR}";sleep 1

	# Iniciar limpeza de sistema
	echo -e "${GREEN}Iniciando a Limpeza do Sistema.${NOCOLOR}";sleep 1
	echo
	sudo apt-get --purge autoremove
	sudo apt-get autoclean
	sudo apt-get clean
	echo
	echo -e "${GREEN}Limpeza concluída.${NOCOLOR}";sleep 1
	echo
	echo -e "${GREEN}Tenha um bom dia.${NOCOLOR}"
	Menu
}

function RPI_Upgrade () {
	# Opção de RPI-Upgrade, com um "if-then-read"
	echo -e "${GREEN}Deseja instalar RPI-Upgrade para Raspi? (s/n)${NOCOLOR}"
	read rpiup
	if [ "$rpiup" == s ]
		then
		sudo rpi-update
	elif [ "$rpiup" == n ]
		then
		echo -e "${GREEN}Maravilha, vamos continuar.${NOCOLOR}";sleep 1
	fi
	Menu
}

function Essencial () {
	# Instalação de software essencial
	echo -e "${GREEN}Instalação de software essencial${NOCOLOR}"
	echo
	echo "1) tilix"
	echo "2) vim"
	echo "3) synaptic"
	echo "4) libreoffice"
	echo "5) htop"
	echo "6) Sair!"
	read software_essencial;
	
	case $software_essencial in
		1) echo "You selected tilix";sleep 1
		sudo apt install tilix -y
		;;
		2) echo "You selected vim";sleep 1
		sudo apt install vim -y
		;;
		3) echo "You selected synaptic";sleep 1
		sudo apt install synaptic -y
		;;
		4) echo "You selected libreoffice";sleep 1
		sudo apt install libreoffice -y	
		;;
		5) echo "You selected htop";sleep 1
		sudo apt install htop -y	
		;;
		6) exit
	esac
	read -n 1 -p "<Enter> Para iniciar"
	Menu
}

function Adicionar () {
	clear
	echo −n "Qual o nome do usuário a se adicionar? "
	read nome
	adduser nome
	Menu
}

function Remover () {
	clear
	echo −n "Qual o nome do usuário a deletar? "
	read nome
	userdel nome
	Menu
}


function Sistema () {
        # Dados do Sistema
	echo -e "${GREEN}Dados do Sistema${NOCOLOR}"
        echo
        echo "1) Memória"
        echo "2) IP"
        echo "3) Temperatura"
        echo "4) Versão Kernel"
        echo "5) Sair!"
        read Dados_sistema;

	case $Dados_sistema in
	        1) Memory;
		;;	
		2) IP;
		;;
		3) Temperatura;
		;;
		4) Kernel
		;;
		5) exit
	esac
	read -n 1 -p "<Enter> Para iniciar"
	Menu
}

function Kernel () {
	#RED HAT: cat /etc/redhat-release
	KERNEL_VERSION_UBUNTU=`uname -mrs`
	KERNEL_VERSION_CENTOS=`uname -mrs`
	if [ -f /etc/lsb-release ]
		then
		echo "kernel version: $KERNEL_VERSION_UBUNTU"
		else
		echo "kernel version: $KERNEL_VERSION_CENTOS"
	fi
}


function Memory () {
	MEMORY_FREE=`free -m  | grep ^Mem | tr -s ' ' | cut -d ' ' -f 4`	
	#MEMORY_TOTAL=
	#MEMORY_USED=
	echo "Verificando memória do sistema..."
	echo "Memória livre: $MEMORY_FREE"     
}

function IP () {
	IP_SISTEMA=`hostname -I`
	echo "IP is: $IP_SISTEMA"
}

function Temperatura () {
	# Temperatura do Processador
	TEMP_FILE=/sys/class/thermal/thermal_zone0/temp
	ORIGINAL_TEMP=$(cat $TEMP_FILE)
	TEMP_C=$((ORIGINAL_TEMP/1000))
	TEMP_F=$(($TEMP_C * 9/5 + 32))
	echo "$TEMP_C C"
	echo "$TEMP_F F"
}

function Sair() {
	echo
	echo -e " ${GREEN}Espero que tenhas um dia 5 Estrelas${NOCOLOR} "
	echo
	echo
	exit
}

Menu

#Espero que tenham gostado.
