#!/usr/bin/env bash

session=$(find ~ ~/workspace/ -mindepth 1 -maxdepth 1 -type d | fzf)

session_name=$(basename "$session" | tr . _)

echo "session $session_name"

if ! tmux has-session -t "$session_name" 2> /dev/null; then
  tmux new-session -s "$session_name" -c "$session" -d
fi

tmux attach -t "$session_name"
