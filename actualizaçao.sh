#!/bin/bash
#Script Automatizado para actualização e limpeza do sistema.

#INICIO
echo "Actualização de Sistema Linux.";sleep 3
clear

function Menu () {
	clear
	echo '*-*-*- Informações Técnicas -*-*-*'       
	echo
	echo " [1] Update e Upgrade do Sistema "
	echo " [2] RPI-Upgrade (Só no Raspberry Raspi) "
	echo " [3] Instalação de Software Essencial "
	echo " [4] Sair "
	echo

	echo -n " >>> Digite a Opção: "
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
	echo "Inicio de Actualização."
	echo
	sudo dpkg --configure -a
	sudo apt-get install -f
	sudo apt-get update 
	sudo apt-get upgrade 
	sudo apt-get dist-upgrade
	echo
	echo "Update e Upgrade concluído.";sleep 1

	# Iniciar limpeza de sistema
	echo "Iniciando a Limpeza do Sistema.";sleep 1
	echo
	sudo apt-get --purge autoremove
	sudo apt-get autoclean
	sudo apt-get clean
	echo
	echo "Limpeza concluída.";sleep 1
	echo "Tenha um bom dia."
	Menu
}

function RPI_Upgrade () {
	# Opção de RPI-Upgrade, com um "if-then-read"
	echo "Deseja instalar RPI-Upgrade para Raspi? (s/n)"
	read rpiup
	if [ "$rpiup" == s ]
		then
		sudo rpi-update
	elif [ "$rpiup" == n ]
		then
		echo "Maravilha, vamos continuar."
	fi
	Menu
}

function Essencial () {
	# Instalação de software essencial
	echo "Instalação de software essencial"
	echo
	echo "1) tilix
	echo "2) vim"
	echo "3) git"
	echo "4) phyton"
	echo "5) Sair!"
	read software_essencial;
	
	case $software_essencial in
		1) echo "You selected tilix";;
		2) echo "You selected vim";;
		3) echo "You selected phyton";;
		4) echo "You selected c++";;
		5) exit
	esac
	Menu
}

function Sair() {
	echo
	echo " Espero que tenhas um dia 5 Estrelas "
	echo
	echo
	exit
}

Menu

#Espero que tenham gostado.
