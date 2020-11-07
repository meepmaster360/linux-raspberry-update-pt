#!/bin/bash
#Script Automatizado para actualização e limpeza do sistema.

#INICIO
echo "Actualização de Sistema Linux.";sleep 3
clear
# Update e Upgrade do sistema
sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get dist-upgrade
echo "Update e Upgrade concluído.";sleep 1
# Iniciar limpeza de sistema
echo "Iniciando a Limpeza do Sistema.";sleep 1
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean
echo "Limpeza concluída.";sleep 1
echo "Tenha um bom dia." 
#Espero que tenham gostado.
