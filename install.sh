case $distros in
        "Debian/Ubuntu")
            echo "Downloading All Is Well Script For Debian/Ubuntu"
            mkdir ~/AIW
            cd ~/AIW || error "Failed to enter directory 'AIW'!"
            wget 'https://raw.githubusercontent.com/spectrumgamer75/Bash-Scripts/master/ALL%20IS%20WELL%20(V2.0)/icon-64.png'
            wget 'https://raw.githubusercontent.com/spectrumgamer75/Bash-Scripts/master/ALL%20IS%20WELL%20(V2.0)/aiwdebianubuntu.sh'
            wget 'https://raw.githubusercontent.com/spectrumgamer75/Bash-Scripts/master/uninstall.sh'
            chmod +x 'uninstall.sh'
            chmod +x 'aiwdebianubuntu.sh'
            echo "[Desktop Entry]
            Name=All Is Well
            GenericName=Update Helper and Fixer
            Comment=ALL IS WELL is a bash script that allows users to easily update and upgrade their repositories and packages on linux, BSD, And More. It will also fix any broken packages and dependencies, if possible. Forget about typing all update/upgrade commands  manually, when ALL IS WELL!
            Exec=$HOME/AIW/aiwdebianubuntu.sh
            Icon=$HOME/AIW/icon-64.png
            Terminal=true
            StartupNotify=true
            Type=Application
            Categories=Utility;" > ~/.local/share/applications/aiw.desktop || error "Failed to create menu entry!"
            clear
            echo "Installation Complete :)"
            break
            ;;
 *) echo "invalid option $REPLY";;
    esac
