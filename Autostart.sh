#!/bin/bash
#
# tumx启动脚本
# mushan 2016-05-20

# 兼容zsh
export DISABLE_AUTO_TITLE="true"

session="Hatsune Miku"

tmux has-session -t "$session"
if [ $? = 0  ];then
    tmux attach-session -t "$session"
    exit
fi

tmux new-session -d -s "$session" -n home
tmux send-keys -t "$session":1 'cd ~' C-m
tmux new-window -t "$session":2 -n edit vi
tmux new-window -t "$session":3 -n zsh
tmux new-window -t "$session":4 -n SSH
tmux send-keys -t "$sesstion":4 'ssh root@' C-e C-m

tmux split-window -t "$session":3 -h
tmux select-window -t "$session":1
tmux -2 attach-session -t "$session"
