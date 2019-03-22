# ----------------------------- FUNÇÃO PARA INSTALAR O JAVA --------------- ---------------- #
Java(){
	#! / bin / bash
	#sudo add-apt-repository ppa: webupd8team / java 
	cd /opt && sudo mkdir /opt/java && sudo chmod -R 777 /opt/java && cd ./java && wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://javadl.oracle.com/webapps/download/AutoDL?BundleId=236878_42970487e3af4f5aa5bca3f542482c60 && sudo chmod -R 777 /opt/java/*
	tar zxf AutoDL?BundleId=236878_42970487e3af4f5aa5bca3f542482c60
	sudo chmod -R 777 /opt/java/*
	sudo update-alternatives --install /usr/bin/java java /opt/java/jre1.8.0_201/bin/java 100
	sudo update-alternatives --install /usr/bin/javaws javaws /opt/java/jre1.8.0_201/bin/javaws 100
	sudo chmod a+x /usr/bin/java && sudo chmod a+x /usr/bin/javaws && sudo chown -R root:root /opt/java/jre1.8.0_201 && sudo update-alternatives --config java && sudo apt-get update && clear && echo "java instalado com sucesso..." && echo "$(date +%F\ %T) Java instalado" >> /opt/Relatorio.txt
}

#-----------------------------FUNÇÃO PARA INSTALAR O GESTOR-----------------------------#
Gestor(){
		#!/bin/bash
		cd /opt && sudo mkdir INHDGestordeSenhas && sudo chmod -R 777 ./INHDGestordeSenhas && cd ./INHDGestordeSenhas && wget http://servidor.inhd.com.br:8080/Versao/javaNova/INHDGestordeSenhas-1.4.21.zip && wget http://servidor.inhd.com.br:8080/Versao/javaNova/INHDGestordeSenhas.sh && wget http://servidor.inhd.com.br:8080/Versao/javaNova/INHDGestordeSenhas.desktop && wget http://servidor.inhd.com.br:8080/Versao/javaNova/logogestor.png && sudo unzip INHDGestordeSenhas-1.4.21.zip && mv INHDGestordeSenhas-1.4.21.jar INHDGestordeSenhas.jar && cd /home/inhd/Área\ de\ Trabalho/ && sudo cp ./INHDGestordeSenhas/INHDGestordeSenhas.desktop /home/inhd/Área\ de\ Trabalho/ && echo "$(date +%F\ %T) Gestor de senhas instalado" >> /opt/Relatorio.txt && clear && echo "gestor instalado com sucesso...";
}
#-----------------------------FUNÇÃO PARA INSTALAR O PLAYER------------------------------#
Player(){
			#!/bin/bash
			cd /opt && sudo mkdir INHD && sudo chmod -R 777 /opt/INHD && cd /opt/INHD; sudo apt-get update; sudo apt-get install postgresql postgresql-contrib; sudo apt-get install pgadmin3; echo "dica"; sudo -i -u postgres psql; alter user postgres with password 'rx306701'; wget http://servidor.inhd.com.br:8080/Versao/javaNova/INHDProcessCenter-1.4.21.1.zip && wget http://servidor.inhd.com.br:8080/Versao/javaNova/INHDStarter-1.4.21.zip && wget http://servidor.inhd.com.br:8080/Versao/javaNova/INHDMonitor-1.4.21.zip && wget http://servidor.inhd.com.br:8080/Versao/javaNova/INHDPlayer-linux-x64-1.4.21.zip && sudo unzip INHDStarter-1.4.21.zip && mv INHDStarter-1.4.21.jar INHDStarter.jar && sudo unzip INHDMonitor-1.4.21.zip && mv INHDMonitor-1.4.21.jar INHDMonitor.jar && sudo unzip INHDPlayer-linux-x64-1.4.21.zip && sudo unzip INHDProcessCenter-1.4.21.1.zip && mv INHDProcessCenter-1.4.21.1.jar INHDProcessCenter.jar && echo "$(date +%F\ %T) Senha Player instalado" >> /opt/Relatorio.txt && clear && echo "player instalado com sucesso..."
}

#-----------------------------VARIAVEIS--------------------------------------------------#
#!/bin/bash
gestor="/opt/INHDGestordeSenhas";
player="/opt/INHD";
echo "Preparando...";
sudo chmod -R 777 /opt && cd /opt;

echo "$(date +%F\ %T) Ultima verificação" >> /opt/Relatorio.txt;
sudo chmod +x Relatorio.txt;
sudo chmod -R 777 /opt/Relatorio.txt;

java -version 2> java.txt
sudo chmod +x java.txt
sudo chmod -R 777 /opt/java.txt
head -1 /opt/java.txt | awk -F"0" '{print substr($1,17,1)}' > atual.txt
sudo chmod +x atual.txt
sudo chmod -R 777 /opt/atual.txt
versaoatual=$(cat atual.txt)



#-----------------------------VALIDAÇÃO--------------------------------------------------#
echo "Instalar o extrator de zip"
sudo apt install unzip
sudo chmod +x java.txt
echo "Verificando java..."

if [[ "$versaoatual" = *8* ]];
 then
	echo "Verificando gestor..."
 else
	Java;
fi

if [ ! -d "$gestor" ];
 then
	Gestor;
 else
	echo "Verificando player..."
fi

if [ ! -d "$player" ];
 then
	Player;
 else
	echo "Pronto";
fi

sudo chmod -R 777 /opt/* && sudo chmod +x /opt/*;
java -version 2> java.txt
sudo chmod +x java.txt
sudo chmod -R 777 /opt/java.txt
head -1 /opt/java.txt | awk -F"0" '{print substr($1,17,1)}' > atual.txt
sudo chmod +x atual.txt
sudo chmod -R 777 /opt/atual.txt
versaoatual=$(cat atual.txt)

