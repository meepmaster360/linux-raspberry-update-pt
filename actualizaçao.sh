#!/bin/bash
#Script Automatizado para atualização e limpeza.

#INICIO
sudo apt-get update 
apt-get upgrade 
sudo apt-get dist-upgrade
echo "Update e Upgrade concluído";sleep 1
echo "Iniciando a Limpeza do Sistema";sleep 1
apt-get autoremove
apt-get autoclean
apt-get clean
echo "Limpeza concluída";sleep 1
echo "Tenha um bom dia" 
#FIM
