#!/bin/bash
# Autor: meepmaster
# Descrição: Instalação automatizada do scrit Linux-Raspberry-Update-pt.

# INICIO

echo "Instalação automatizada do Scrit Linux-Raspberry-Update-pt"
read -r -p "Tem a certeza, certezinha, de instalar o Script? [S/n] " input

case $input in
	[sS][iI][mM]|[sS]) 
		echo "Download e instalação do LRU-pt"
		mkdir ~/LRU
		cd ~/LRU || error "Falha da entrada no 'LRU'!"
		wget 'https://raw.githubusercontent.com/meepmaster360/linux-raspberry-update-pt/main/icon-64.png'
		wget 'https://raw.githubusercontent.com/meepmaster360/linux-raspberry-update-pt/main/actualizacao.sh'
		wget 'https://raw.githubusercontent.com/meepmaster360/linux-raspberry-update-pt/main/unistall.sh'
		chmod +x 'uninstall.sh'
		chmod +x 'actualizacao.sh'
		echo "[Desktop Entry]
		Name=All Is Well
		GenericName=Update Helper and Fixer
		Comment=LRU isa bash script that allows users to easily update and upgrade their Systems!
		Exec=$HOME/LRU/actualizacao.sh
		Icon=$HOME/LRU/icon-64.png
		Terminal=true
		StartupNotify=true
		Type=Application
		Categories=Utility;" > ~/.local/share/applications/aiw.desktop || error "Falha na criação de entrada para Desktop!"
		sleep 1		
		clear
            	echo "Instalação completa :)"
            	break
	;;
	[nN][aãA][oO]|[nN])
                echo "Não"
                echo "Desinstalação interrompida no último segundo de sobried>
                sleep 3
                exit 1
	;;
	*)      
                echo "Escolha omissa, sim ou não, s ou n."
                exit 1
        ;;
esac
