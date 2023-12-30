#!/bin/bash
# MyServer_1_7_9
SESSION_NAME=""
# java -jar -Xmx4G server.jar -nogui
COMMAND=""
# /home/peipei/minecraft-server
WORK_DIR=""


if [[ -z $SESSION_NAME || -z $COMMAND || -z $WORK_DIR ]]; then
	echo -e "\033[1;31m[WARN] String is Empty"
	(exit 1)
	exit
fi
cd $WORK_DIR
echo -e "\033[1;33m[INFO] \033[1;37mEnter to WORK_DIR: `pwd`"
if [[ $1 == "debug" ]]; then
	echo -e "\033[1;31m[DEBUG]: Start Minecraft Server IN DEBUG MODE (NO tmux)"
	$COMMAND
	(exit 0)
	exit
fi
echo -e "\033[1;33m[INFO] \033[1;32mStart Minecraft Server IN NORMAL MODE \033[1;31m"
tmux kill-session -t $SESSION_NAME
tmux new-session -d -s $SESSION_NAME $COMMAND
if [[ $? != 0 ]]; then
	echo -e "\033[1;31m[WARN] ERROR"
	(exit 1)
	exit
fi
echo -e "\033[1;33m[INFO] \033[1;37mHow to control a Minecraft server"
echo -e "\033[1;33m[INFO] \033[1;37mUse: tmux a -t SESSION_NAME"
(exit 0)
exit
