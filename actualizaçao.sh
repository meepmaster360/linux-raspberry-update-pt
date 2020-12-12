#!/bin/bash
# Autor: meepmaster
# Descrição: Script Automatizado para actualização e limpeza do sistema.

# INICIO
echo "Actualização de Sistema Linux.";sleep 3
# Padrão de cores para cabeçalhos
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

clear

function Menu () {
	clear
	echo -e "*-*-*- ${GREEN}SCRIP BY MEEPMASTER{NOCOLOR} -*-*-*" 
	echo -e "*-*-*- ${GREEN}UPDATE & UPGRADE{NOCOLOR} -*-*-*" 
	echo
	echo -e " [1] ${GREEN}Update e Upgrade do Sistema{NOCOLOR} "
	echo -e " [2] ${GREEN}RPI-Upgrade ${RED}(Só no Raspberry Raspi){NOCOLOR} "
	echo -e " [3] ${GREEN}Instalação de Software Essencial{NOCOLOR} "
	echo -e " [4] ${GREEN}Sair{NOCOLOR} "
	echo

	echo -n -e " ${GREEN}>>> Digite a Opção:{NOCOLOR} "
	read opcao

	case $opcao in
	 1) Update_upgrade ;;
	 2) RPI_Upgrade ;;
	 3) Essencial ;;
	 4) Sair ;;
	 *) "Opção Inválida." ; echo ; Menu ;;
	esac
}


function Update_upgrade () {
	# Update e Upgrade do sistema
	echo -e "${GREEN}Inicio de Actualização.{NOCOLOR}"
	echo
	sudo dpkg --configure -a
	sudo apt-get install -f
	sudo apt-get update 
	sudo apt-get upgrade 
	sudo apt-get dist-upgrade
	echo
	echo -e "${GREEN}Update e Upgrade concluído.{NOCOLOR}";sleep 1

	# Iniciar limpeza de sistema
	echo -e "${GREEN}Iniciando a Limpeza do Sistema.{NOCOLOR}";sleep 1
	echo
	sudo apt-get --purge autoremove
	sudo apt-get autoclean
	sudo apt-get clean
	echo
	echo -e "${GREEN}Limpeza concluída.{NOCOLOR}";sleep 1
	echo
	echo -e "${GREEN}Tenha um bom dia.{NOCOLOR}"
	Menu
}

function RPI_Upgrade () {
	# Opção de RPI-Upgrade, com um "if-then-read"
	echo -e "${GREEN}Deseja instalar RPI-Upgrade para Raspi? (s/n){NOCOLOR}"
	read rpiup
	if [ "$rpiup" == s ]
		then
		sudo rpi-update
	elif [ "$rpiup" == n ]
		then
		echo -e "${GREEN}Maravilha, vamos continuar.{NOCOLOR}"
	fi
	Menu
}

function Essencial () {
	# Instalação de software essencial
	echo -e "${GREEN}Instalação de software essencial{NOCOLOR}"
	echo
	echo "1) tilix"
	echo "2) vim"
	echo "3) deluge"
	echo "4) htop"
	echo "5) Sair!"
	read software_essencial;
	
	case $software_essencial in
		1) echo "You selected tilix"
		sudo apt install tilix;;
		2) echo "You selected vim"
		sudo apt install vim;;
		3) echo "You selected deluge"
		sudo apt install deluge;;
		4) echo "You selected htop"
		sudo apt install htop;;
		5) exit
	esac
	Menu
}

function Sair() {
	echo
	echo -e " ${GREEN}Espero que tenhas um dia 5 Estrelas{NOCOLOR} "
	echo
	echo
	exit
}

Menu

#Espero que tenham gostado.
