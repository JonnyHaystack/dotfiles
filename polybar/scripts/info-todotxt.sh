#!/bin/sh

TODO_PATH=~/.todo
task_count=$(grep -v '^\s*$' "$TODO_PATH/todo.txt" | wc -l)

if [ "$task_count" -gt 0 ]; then
    echo "%{u#ffeb3b}%{+u}%{F#666}%{F-} $task_count%{u-}"
else
    echo "%{u#4caf50}%{+u}%{F#666}%{F-} $task_count%{u-}"
fi
