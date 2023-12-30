#!/bin/sh
# screen or tmux
MODE="screen"
# MyServer_1_7_9
SESSION_NAME=""
# java -jar -Xmx4G server.jar -nogui
COMMAND=""
# /home/peipei/minecraft-server
WORK_DIR=""

if [ -z "$SESSION_NAME" ] || [ -z "$COMMAND" ] || [ -z "$WORK_DIR" ] || [ "$MODE" != "screen" ] && [ "$MODE" != "tmux" ]; then
    echo "\033[1;31m[WARN] String is Empty"
    exit 1
fi

cd "$WORK_DIR"
echo "\033[1;33m[INFO] \033[1;37mEnter to: $(pwd)"
if [ "$1" = "debug" ]; then
    echo "\033[1;31m[DEBUG]: Start Minecraft Server IN DEBUG MODE (NO screen or tmux)"
    $COMMAND
    exit 0
fi

echo "\033[1;33m[INFO] \033[1;32mStart Minecraft Server IN $MODE \033[1;31m"
case $MODE in
    tmux)
        tmux kill-session -t "$SESSION_NAME"
        tmux new-session -d -s "$SESSION_NAME" $COMMAND
        ;;
    screen)
        screen -dmS "$SESSION_NAME" $COMMAND
        ;;
esac

if [ $? -ne 0 ]; then
    echo "\033[1;31m[WARN] ERROR Exit..."
    exit 1
fi

echo "\033[1;33m[INFO] \033[1;37mHow to control a Minecraft server"
case $MODE in
    tmux)
        echo "\033[1;33m[INFO] \033[1;37mUse: tmux a -t $SESSION_NAME"
        ;;
    screen)
        echo "\033[1;33m[INFO] \033[1;37mUse: screen -r $SESSION_NAME"
        ;;
esac
exit 0
