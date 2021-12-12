# vim: set ft=bash

fish_add_path /opt/
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/cargo/bin

alias nvim="nvim"
alias e="nvim"
alias vim="nvim"
alias ls="exa"
alias py="python"
alias grep="rg"
alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"
alias ssh="ssh -F $HOME/.config/ssh/config"
alias scp="scp -F $HOME/.config/ssh/config"
alias startx="startx $HOME/.config/xorg/xinitrc"
alias newsboat="newsboat -r -u $HOME/.config/newsboat/urls.txt"
alias work="cd ~/docs && tmux new -s work"

set -x CARGO_HOME "$HOME/.config/cargo"
set -x RUSTUP_HOME "$HOME/.config/rustup"
set -x XDG_DATA_HOME "$HOME/.config"
set -x PYTHONSTARTUP "$HOME/.config/python/pythonrc"
set -x XAUTHORITY "$HOME/.config/xorg/Xauthority"
set -x GTK2_RC_FILES "$HOME/.config/gtkrc-2.0"
set -x GNUPGHOME "$HOME/.config/gnupg"
set -x LESSHISTFILE /dev/null
set -x GPG_TTY (tty)
set -x GIT_SSH_COMMAND "ssh -F $HOME/.config/ssh/config -o IdentitiesOnly=yes"
set -x GOPATH "$HOME/.config/go"
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x MOZ_USE_XINPUT2 1
set -x JAVA_HOME "/usr/lib/jvm/default"
set -x BROWSER "firefox"

function log
	set __log_file "$HOME/docs/log/"(date '+%Y%m%d%H%M')".txt"
	nvim $__log_file
	curl 'https://logs.itstommy.xyz/upload' \
		-F "file=@"$__log_file \
		-u (whoami):(read -s -P "Logs password: ") \
		&>/dev/null
end

if status is-interactive
and not set -q TMUX
and set -q DISPLAY
	exec tmux new-session -A -s main
end
