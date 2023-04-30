#! /bin/bash
## user-data: Criando ambiente inicial para Devs Java - Distro Ubuntu 22.04 LTS
## By Marcos F. Alves
## Elaborado com base em: https://github.com/rodrigocesarmelo/devopstools

echo "
###  Java Dev Tools - Install ###

ATENÇÃO! Antes de qualquer instalação, atualize os pacotes por pelo menos UMA vez (Opção 0)!
- Baseado nas documentações oficiais.

############################################################
-ATENÇÃO! Ao selecionar instalação do docker ou todos 
          o sistema será reiniciado. SALVE SEUS TRABALHOS
############################################################

0. Atualizar pacotes
1. Docker
2. Docker Compose
3. Git
4. AWS CLI
5. SDK Man
6. JetBrains ToolBox
7. Postman
8. DBeaver CE
98. Oh My Zsh
99. Todos 
00. Limpar lixo de pacotes

Digite o software que deseja instalar: "
read tool

updatePackages()
{
    echo "### Atualizando pacotes... ###"
    sudo apt update && sudo apt upgrade
    sudo apt install curl -y
    echo "### Pacotes atualizados! ###"
}


installDocker()
{
    echo "### Instalando DOCKER ###"

    echo "### Docker install - Install using the repository ###"
    # Documentation: https://docs.docker.com/engine/install/ubuntu/
    echo -e "\n1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:"
    sudo apt install lsb-release ca-certificates curl gnupg vim apt-transport-https -y
        
    echo -e "\n2. Add Docker’s official GPG key:"
    sudo mkdir -m 0755 -p /etc/apt/keyrings
    #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        
    echo -e "\n3. Use the following command to set up the repository:"
    #echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
       
    echo -e "\nInstall Docker Engine, containerd"
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin -y
    sudo usermod -aG docker $USER
    echo -e "\nFinalizado instalacao do DOCKER\n"

    echo "-------------------------//-------------------------"
}


installDockerCompose()
{
    echo -e "### Instalando DOCKER COMPOSE ###\n"
    sudo apt install docker-compose -y
    echo -e "\nFinalizado instalacao do DOCKER COMPOSE\n"
    echo "-------------------------//-------------------------"
}


installGit()
{
    echo -e "### Instalando GIT ###\n"
    sudo apt install git -y
    echo -e "\n Finalizado instalacao do GIT\n"
    echo "-------------------------//-------------------------"
}


installAWSCli()
{
    echo -e "\n### Instalando AWS CLI ###"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
    sudo unzip -q /tmp/awscliv2.zip -d /tmp
    sudo /tmp/aws/install
    echo -e "\nFinalizado instalacao do AWS CLI\n"
    echo "-------------------------//-------------------------"
}


installSDKMan()
{
    echo "### Instalando SDK Man e Java ###"
    sudo curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    echo -e "\nFinalizando instalação SDK Man\n"
    echo "-------------------------//-------------------------"

    echo "### Instalando versões LTS do Java (8, 11 e 17) ###"
    sdk install java 8.0.362-tem
    sdk install java 11.0.18-tem
    sdk install java 17.0.6-tem

    echo -e "\nFinalizado Instalação do Java.\n"
    echo "-------------------------//-------------------------"
}


installJetBrainsToolBox()
{
    echo "### Instalando JetBrains ToolBox  ###"
    sudo add-apt-repository universe
    sudo apt install libfuse2
    mkdir -p ~/apps
    tar -xvz -C ~/apps/ -f <(wget -q -O - https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.3.14493.tar.gz)
    ~/apps/jetbrains-toolbox-1.27.3.14493/./jetbrains-toolbox
    echo -e "\nFinalizado instalação JetBrains ToolBox\n"
    echo "-------------------------//-------------------------"
}


installPostman()
{
    echo "### Instalando Postman  ###"
    mkdir -p ~/apps
    tar -xvz -C ~/apps/ -f <(wget -q -O - https://dl.pstmn.io/download/latest/linux_64)
    sudo cp ~/apps/Postman/app/icons/icon_128x128.png /usr/share/pixmaps/postman.png
    cp ./postman.desktop ~/.local/share/applications/postman.desktop
    chmod +x ~/.local/share/applications/postman.desktop
    echo -e "\nFinalizado instalação Postman\n"
    echo "-------------------------//-------------------------"
}

installDbeaver()
{
    echo "### Instalando DBeaver CE  ###"
    curl "https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb" -o "/tmp/dbeaver-ce_latest_amd64.deb"
    sudo apt-get --yes --fix-broken install /tmp/dbeaver-ce_latest_amd64.deb
    echo -e "\nFinalizado instalação DBeaver CE\n"
    echo "-------------------------//-------------------------"
}

installOhMyZSH()
{
    #https://github.com/deluan/zsh-in-docker
    echo "### Instalando Oh My Zsh ###"
    sudo sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)
    echo -e "\nFinalizado instalação Oh My Zsh\n"
    echo "-------------------------//-------------------------"
}

installAll()
{
    echo "### Instalando TODAS as tools ###"
    updatePackages && installDocker && installDockerCompose && installGit && installAWSCli && installSDKMan && installJetBrainsToolBox && installPostman && installDbeaver && installOhMyZSH && clearPackages
    echo -e "\nFerramentas instaladas\n"
}

rebootSystem()
{
    echo "### Instalação finalizada com sucesso! ###"
    echo "### Reiniciando o sistema em 15s...... ###"
    sleep 15s
    sudo shutdown -r now
}

clearPackages()
{
    echo "### Limpando lixo de pacotes ###"
    sudo apt autoremove
    sudo apt clean
    echo -e "\nFinalizando limpeza\n"
}

case $tool in 
    0)  updatePackages ;;

    1)  installDocker && rebootSystem ;;

    2)  installDockerCompose ;;

    3)  installGit ;;    

    4)  installAWSCli ;;

    5)  installSDKMan ;;

    6)  installJetBrainsToolBox ;;

    7)  installPostman ;;

    8) installDbeaver ;;

    98) installOhMyZSH ;;

    99)  installAll && rebootSystem;;

    00) clearPackages ;;

    *)  echo "Codigo Invalido" ;;
esac