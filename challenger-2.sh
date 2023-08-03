#! /bin/bash

#criei uma variável para o comando que eu quero que o crontab rode:
CRON_JOB="* * * * * ping -c5 localhost >> /home/jcz/crontest.txt"
#limpar uma crontab com e sem sudo:
sudo crontab -r
crontab -r
#esse comando remove o pacote cron:
for cronfdp in $(sudo dpkg -l | grep cron | awk {'print $2'}); do printf $cronfdp; sudo apt purge -y $cronfdp; done
echo cron desinstalado
#boas práticas:
sudo apt update -y
#aqui ele instala o cron:
sudo apt install cron -y
#aqui vc habilita o cron para iniciar quando ligar a vm:
sudo systemctl enable cron
#aqui vc ve se está rodando e se está enable:
systemctl status cron
#aqui eu removi o antigo diretorio da config que vou colocar no cron:
rm /home/jcz/crontest.txt 
#e aqui eu criei o arquivo vazio pra quando rodar o cron:
touch crontest.txt /home/jcz/
#aqui ele vai colocar a variavel $CRON_JOB para rodar no crontab
#essa é uma formula de não precisar entrar no editor vim
( sudo crontab -l ; echo "$CRON_JOB" ) | sudo crontab -

echo "Crontab criada"
