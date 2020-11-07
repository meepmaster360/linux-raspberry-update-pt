#!/bin/bash
#Script Automatizado para actualização e limpeza do sistema.

#INICIO
echo "Actualização de Sistema Linux.";sleep 1
clear
# Update e Upgrade do sistema
sudo apt-get update 
apt-get upgrade 
sudo apt-get dist-upgrade
echo "Update e Upgrade concluído.";sleep 1
# Opção de RPI-Upgrade, com um "if-then-read"
echo "Deseja instalar RPI-Upgrade? (s/n)"
read rpiup
if [ "$rpiup" == s ]
then
sudo rpi-update
elif [ "$rpiup == n ]
then
echo "Maravilha, vamos continuar."
fi
echo "Iniciando a Limpeza do Sistema.";sleep 1
apt-get autoremove
apt-get autoclean
apt-get clean
echo "Limpeza concluída.";sleep 1
echo "Tenha um bom dia." 
#Espero que tenham gostado.
