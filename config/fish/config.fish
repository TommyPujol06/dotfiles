fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/cargo/bin

alias e="nvim"
alias ls="exa"
alias py="python"
alias grep="rg"
alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"
alias ssh="ssh -F $HOME/.config/ssh/config"
alias startx="startx $HOME/.config/xorg/xinitrc"

set -x CARGO_HOME "$HOME/.config/cargo"
set -x XDG_DATA_HOME "$HOME/.config"
set -x PYTHONSTARTUP "$HOME/.config/python/pythonrc"
set -x XAUTHORITY "$HOME/.config/xorg/Xauthority"
set -x GTK2_RC_FILES "$HOME/.config/gtkrc-2.0"
set -x GNUPGHOME "$HOME/.config/gnupg"
set -x LESSHISTFILE /dev/null
set -x GPG_TTY (tty)
set -x GIT_SSH_COMMAND "ssh -F $HOME/.config/ssh/config -o IdentitiesOnly=yes"
