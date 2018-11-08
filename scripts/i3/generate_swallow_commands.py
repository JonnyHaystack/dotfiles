from __future__ import print_function
import i3ipc
import psutil
import sys
from wmctrl import Window

# Function for printing to stderr.
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

# Command mappings for specific programs whose process command is not the same
# as the one that should be used to launch it.
window_class_command_mappings = {
        'Gnome-terminal': ('gnome-terminal --working-directory=', True),
        # 'Alacritty': ('alacritty', True),
        }

i3 = i3ipc.Connection()

# Loop through windows.
for con in i3.get_tree():
    if (con.window
            and con.parent.type != 'dockarea'
            and con.workspace().name == sys.argv[1]):

        # Get information on this window.
        try:
            window = Window.by_id(con.window)[0]
        except ValueError as err:
            continue
        try:
            window
        except NameError:
            continue
        if not window: continue
        pid = window.pid
        if pid == 0: continue

        # Get process info for the window.
        procinfo = psutil.Process(pid)

        # Create command to launch program.
        # If there is a special command mapping for this program.
        if con.window_class in window_class_command_mappings:
            # If the program is a terminal.
            if window_class_command_mappings[con.window_class][1]:
                # Get the working directory from the window title (I'm sorry)
                # and stick it on the end of the command mapping.
                working_directory = con.name.split(': ', 1)[1]
                # Change ~ to $HOME because gnome-terminal doesn't seem to
                # support ~.
                working_directory = working_directory.replace("~", "$HOME")
                command = '{0}{1}'.format(
                        window_class_command_mappings[con.window_class][0],
                        working_directory,
                        )
            else:
                # If the program is not a terminal, launch it by cd'ing to its
                # working directory (obtained by psutil) and then executing
                # its mapped command.
                command = 'cd {0}; exec {1}'.format(
                        procinfo.cwd(),
                        window_class_command_mappings[con.window_class][0],
                        )
        else:
            # If the program has no special mapping, launch it by cd'ing to its
            # working directory (obtained by psutil) and then executing the
            # first index of the cmdline (hopefully this will work for almost
            # all programs I use at least).
            command = 'cd {0}; exec {1}'.format(
                    procinfo.cwd(),
                    procinfo.cmdline()[0],
                    )
        # Print the command.
        print('\n{0}'.format(command))
