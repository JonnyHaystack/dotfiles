#!/bin/sh

TODO_PATH=~/.todo
task_count=$(grep -v '^\s*$' "$TODO_PATH/todo.txt" | wc -l)

if [ "$task_count" -gt 0 ]; then
    echo "%{u#f9dd04}%{+u}%{F#666}%{F-} $task_count%{u-}"
else
    echo "%{u#38d638}%{+u}%{F#666}%{F-} $task_count%{u-}"
fi
