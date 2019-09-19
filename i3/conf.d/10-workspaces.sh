#!/bin/bash

declare -A workspace_keys

# Create map of which key corresponds to each workspace.
for i in {1..10}
do
  workspace_keys[$i]=${i: -1}
done
for i in {11..20}
do
  workspace_keys[$i]=F$(($i - 10))
done

for workspace in ${!workspace_keys[@]}
do
  workspace_key=${workspace_keys[$workspace]}

  switch_bindings="${switch_bindings}\
bindsym \$mod+${workspace_key} workspace ${workspace}
"

  move_bindings="${move_bindings}\
bindsym \$mod+Control+${workspace_key} move container to workspace ${workspace}
"

  save_bindings="${save_bindings}  \
bindsym ${workspace_key} exec \"\$i3_resurrect save -w ${workspace}\
 --swallow=class,instance,title\"
"

  restore_bindings="${restore_bindings}  \
bindsym ${workspace_key} exec \"\$i3_resurrect restore -w ${workspace}\
 --programs-only\"
  \
bindsym \$mod+${workspace_key} exec \"\$i3_resurrect restore -w ${workspace}\
 --layout-only\"
"
done

# Output configuration directives for i3 config.
echo "# Switch to workspace
$switch_bindings"

echo "# Move focused container to workspace
$move_bindings"

echo "# Save workspace mode
mode \"save\" {
$save_bindings
  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym s mode "default"
  bindsym \$mod+s mode "default"
}

bindsym \$mod+s mode \"save\"
"

echo "# Restore workspace mode
mode \"restore\" {
$restore_bindings
  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym n mode "default"
  bindsym \$mod+n mode "default"
}

bindsym \$mod+n mode \"restore\""
