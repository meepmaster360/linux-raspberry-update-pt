#!/bin/bash
# Autor: meepmaster
# Descrição: Instalação automatizada do scrit Linux-Raspberry-Update-pt.

# INICIO

echo "Instalação automatizada do Scrit Linux-Raspberry-Update-pt"
read -r -p "Tem a certeza, certezinha, de instalar o Script? [S/n] " input

case $input in	
	[sS][iI][mM]|[sS]) 
		echo "Download e instalação do LRU-pt"
		mkdir /home/LRU
		cd /home/LRU || echo "Falha da entrada no directorio 'LRU'!"
		wget 'https://raw.githubusercontent.com/meepmaster360/linux-raspberry-update-pt/main/actualizacao.sh'
		wget 'https://raw.githubusercontent.com/meepmaster360/linux-raspberry-update-pt/main/unistall.sh'
		chmod +x 'uninstall.sh'
		chmod +x 'actualizacao.sh'
		echo "Instalação completa :)"
	;;
	[nN][aãA][oO]|[nN])
		echo "Não"
		echo "Instalação adiada para momento mais oportuno. ;)"
		sleep 3
		exit 1
	;;
	*)
		echo "Escolha omissa, sim ou não, s ou n."
		exit 1
	;;
esac
