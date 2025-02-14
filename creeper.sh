#!/bin/bash


##########################################################################################
#                                                                                        #
#        creeper.sh - Offensive Global Minecraft(R) Server Scanner                       #
#                                                                                        #
#        Copyright (C) 2021  Obscenity <https://github.com/ObscenityIB/creeper>          #
#                                                                                        #
#        This program is free software: you can redistribute it and/or modify            #
#        it under the terms of the GNU Affero General Public License as                  #
#        published by the Free Software Foundation, only version 3 of the                #
#        License, and no later version.                                                  #
#                                                                                        #
#        This program is distributed in the hope that it will be useful,                 #
#        but WITHOUT ANY WARRANTY; without even the implied warranty of                  #
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                   #
#        GNU Affero General Public License for more details.                             #
#                                                                                        #
#        You should have received a copy of the GNU Affero General Public License        #
#        along with this program.  If not, see <https://www.gnu.org/licenses/>.          #
#                                                                                        #
##########################################################################################


echo -e "\n                \e[38;5;92m     @@@@@@@  @@@@@@@   @@@@@@@@  @@@@@@@@  @@@@@@@   @@@@@@@@  @@@@@@@ "
echo -e "\033[38;5;151m██\033[38;5;34m██\033[38;5;71m██\033[38;5;151m██\033[38;5;188m██\033[38;5;114m██\033[38;5;113m██\033[38;5;65m██\e[38;5;92m    @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@"
echo -e "\033[38;5;28m██\033[38;5;77m██\033[38;5;71m██\033[38;5;77m██\033[38;5;65m██\033[38;5;77m██\033[38;5;71m██\033[38;5;188m██\e[38;5;92m    !@@       @@!  @@@  @@!       @@!       @@!  @@@  @@!       @@!  @@@"
echo -e "\033[38;5;77m██\033[38;5;22m██\033[38;5;59m██\033[38;5;114m██\033[38;5;65m██\033[38;5;22m██\033[38;5;59m██\033[38;5;188m██\e[38;5;92m    !@!       !@!  @!@  !@!       !@!       !@!  @!@  !@!       !@!  @!@"
echo -e "\033[38;5;77m██\033[38;5;22m██\033[38;5;124m██\033[38;5;77m██\033[38;5;71m██\033[38;5;124m██\033[38;5;22m██\033[38;5;113m██\e[38;5;92m    !@!       @!@!!@!   @!!!:!    @!!!:!    @!@@!@!   @!!!:!    @!@!!@! "
echo -e "\033[38;5;114m██\033[38;5;71m██\033[38;5;114m██\033[38;5;22m██\033[38;5;22m██\033[38;5;187m██\033[38;5;65m██\033[38;5;77m██\e[38;5;92m    !!!       !!@!@!    !!!!!:    !!!!!:    !!@!!!    !!!!!:    !!@!@!  "
echo -e "\033[38;5;150m██\033[38;5;65m██\033[38;5;59m██\033[38;5;16m██\033[38;5;16m██\033[38;5;22m██\033[38;5;77m██\033[38;5;151m██\e[38;5;92m    :!!       !!: :!!   !!:       !!:       !!:       !!:       !!: :!! "
echo -e "\033[38;5;151m██\033[38;5;71m██\033[38;5;16m██\033[38;5;16m██\033[38;5;16m██\033[38;5;16m██\033[38;5;71m██\033[38;5;65m██\e[38;5;92m    :!:       :!:  !:!  :!:       :!:       :!:       :!:       :!:  !:!"
echo -e "\033[38;5;77m██\033[38;5;113m██\033[38;5;22m██\033[38;5;114m██\033[38;5;151m██\033[38;5;22m██\033[38;5;65m██\033[38;5;77m██\e[38;5;92m     ::: :::  ::   :::   :: ::::   :: ::::   ::        :: ::::  ::   :::"
echo -e "                \e[38;5;92m     :: :: :   :   : :  : :: ::   : :: ::    :        : :: ::    :   : :"
echo -e "\n                          v1.2.0.0 - Dr. Creep - Copyright 2021 Obscenity\e[0m"
#Set vars
logtime=$(date +"%FT%H%M%z")

#Create clean log dir
if [ ! -d "./creeper-logs/" ]; then
        mkdir -p ./creeper-logs/ || echo -e "\e[38;5;9m\n\nUnable to create log directory here.\n\n\e[0m" 2>&1
fi


#Catch kill
trap ctrl_c INT
function ctrl_c() {
        echo -e "\e[38;5;9m\n\n** Ctrl+C Pressed, Exiting...\n\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
        exit 2
}

#didnt work

if [ ! -f "/usr/bin/python3" ]; then
        echo -e "\e[38;5;29m\n\npython3\e[38;5;9m was not found at \e[38;5;29m/usr/bin/python3\e[38;5;9m\nYou can install it with \e[38;5;29msudo apt install python3 python3-pip -y\e[38;5;9m\n\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
        exit 4
fi




#Check args
if [ $# -eq 0 ]
  then
    echo -e "\e[38;5;9m\nNo target specified.\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
    echo -e "\e[38;5;9m\nUsage: ./creeper.sh <target> [--mcc]\nTarget can be a CIDR range, eg. 127.0.0.0/8\n--mcc will join servers automatically and run a script.\n\e[0m" 2>&1 | tee -a -i ./creeper-logs/creeper-logger-$logtime.log
	exit 6
fi


##Begin scan
echo -e "\e[38;5;19m\n\nScanning target '$1'\n\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
sudo masscan --excludefile exclude.conf -p 25565 --rate 5000 -oG ./creeper-logs/creeper-scan-$logtime.log $1 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log


#Checkpoint
if [ ! -f "./creeper-logs/creeper-scan-$logtime.log" ]; then
    echo -e "\e[38;5;9m\nUnable to find our scan results, did something happen?\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
	exit 7
fi

echo -e "\e[38;5;19m\n\nScan Finished, Processing results...\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log

##Cut the list
grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ./creeper-logs/creeper-scan-$logtime.log > /tmp/creeper-grepfile-$logtime


#Checkpoint
if [ ! -f "/tmp/creeper-grepfile-$logtime" ]; then
    echo -e "\e[38;5;9m\nUnable to find the processed list, did something happen?\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
	exit 8
fi


##Process cut list
while read line
do
    echo -e "\e[38;5;19m\nChecking $line...\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
    mcstatus $line status 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
    echo -e "\e[38;5;29m\n+============================+\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
done < /tmp/creeper-grepfile-$logtime

##Use mcc script
if [[ $2 = "--mcc" ]]; then

	if [ ! -f "/usr/bin/mono" ]; then
        echo -e "\e[38;5;29m\n\nmono\e[38;5;9m, for --mcc argument, was not found at \e[38;5;29m/usr/bin/mono\e[38;5;9m\nYou can install it with \e[38;5;29msudo apt install mono-complete\e[38;5;9m\n\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
        exit 9
	fi

	echo -e "\e[38;5;11m\nMCC argument specified, attempting to run...\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
	cd ./console-client
	read -p "Alt Username: " mccuser
	read -sp "Alt Password: " mccpass

		while read mccline
		do
			echo -e "\e[38;5;19m\nJoining $mccline...\n\n\e[0m" 2>&1 | tee -a ../creeper-logs/creeper-logger-$logtime.log
			mono MinecraftClient.exe creeper.sh.ini $mccuser $mccpass $mccline 2>&1 | tee -a ../creeper-logs/creeper-logger-$logtime.log
			echo -e "\e[38;5;29m\n+============================+\n\e[0m" 2>&1 | tee -a ../creeper-logs/creeper-logger-$logtime.log
			echo "$mccline" >> ../exclude.conf #add line by line instead of below setting
		done < /tmp/creeper-grepfile-$logtime
	#cat /tmp/creeper-grepfile-$logtime >> ../exclude.conf
	#add after, doesnt have the effect of resuming from a stuck mcc script
	cd ..
fi

echo -e "\e[38;5;46m\n[ ALL DONE! ]\n\nYou can view the logs in colour with \e[38;5;29mcat\e[38;5;46m or \e[38;5;29mless -r\e[38;5;46m\n\n\e[0m" 2>&1 | tee -a ./creeper-logs/creeper-logger-$logtime.log
exit 0
