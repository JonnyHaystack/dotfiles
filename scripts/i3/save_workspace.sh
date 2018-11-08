#!/bin/bash

if [ "$#" -eq 1 ]
then
  i3-save-tree --workspace $1 | tail -n +2 | fgrep -v '// splitv' | sed \
    's|//||g' | sed -E '/\"title\"\:|\"window_role\"\:/d' \
    >> ~/.i3/workspace_$1.json

  # Call python script to generate script to fill workspace.
  echo '#!/bin/bash' > ~/.i3/workspace_$1.sh
  python ~/scripts/i3/generate_swallow_commands.py $1 \
    >> ~/.i3/workspace_$1.sh
fi
