# How to create a simple Health-check system using cronjob

**1.First, we need run a update and upgrade commands (good practices):**
```sudo apt update && sudo apt upgrade -y
```
**2.After this, we can install the cronjob:**
```
sudo apt install cron -y
```
**3.To check it's running:**
```
systemctl status cron
```
**4.To enable cronjob when the VM's start:**
```
systemctl enable cron
```
**5.Enter in crontab for running a command:**
```
crontab -e
```
``Here need confirm what text-editor you can use in crontab``
``I use the vim editor, so i need put the number 2``
**6.Put your command on crontab:**
```
* * * * * ping -c5 localhost >> /path/to/example.txt
```
``This is an example of command you can use.``
``* * * * * means: the command will running every minute, you can change this period``
**7.After exited the editor you need wait the time command (1min) and cat the file on the path you chose:**
```
cat /path/to/example.txt
```
**8.If you want to:**
```
crontab -r (to remove the crontab created.)
crontab -l (list of crontabs.)
crontab -e (create or edit a new crontab.)
```
**9.To create a new crontab without use the text-editor, you need to create the variable:**
```
CRON_JOB="* * * * * ping -c5 localhost >> /path/to/example.txt"
```
**10.After this run this command with the variable:**
```
( crontab -l ; echo "$CRON_JOB" ) | crontab -
```
