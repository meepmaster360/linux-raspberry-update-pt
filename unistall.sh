#!/bin/bash
# Autor: meepmaster
# Descrição: Desinstalação automatizada do scrit Linux-Raspberry-Update-pt.

# INICIO

echo "Desinstalação automatizada do Scrit Linux-Raspberry-Update-pt"
read -r -p "Tem a certeza, certezinha, de desinstalar o Script? [S/n] " input

case $input in
	[sS][iI][mM]|[sS]) 
		echo "Sim"
		echo "Desinstalação completa."
		rm -r /home/LRU
		;;
	[nN][aãA][oO]|[nN])
		echo "Não"
 		echo "Desinstalação interrompida no último segundo de sobriedade..."
 		sleep 3
 		exit 1
      	;;
	*)	
		echo "Escolha omissa, sim ou não, s ou n."
		exit 1
		;;
esac
