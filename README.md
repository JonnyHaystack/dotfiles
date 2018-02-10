# My dotfiles
This repo contains my Linux configuration files (or "dotfiles").
Currently this includes:
- vim configuration files
- bash configuration files
- .inputrc
- tmux configuration files
# Setting up on new machine
1. Add the new machine's SSH key to my GitHub account.
2. Clone this repo.
3. Once cloned, I can run the script "setupLinks.sh".
This will create symlinks so that all my config files appear in their correct locations.
4. For the bash configuration, I must do the following:
- Make sure .bash_profile sources .bashrc
- Make sure .bashrc sources .bash_config
- Make sure .bashrc sources .bash_aliases
- Put machine independent bash configuration in .bash_config 
- Put machine specific aliases in .bash_aliases
- Put machine specific configuration in .bashrc
