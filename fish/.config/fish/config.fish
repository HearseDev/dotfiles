#Start tmux
if status is-interactive
# don't nest inside another tmux
and not set -q TMUX
  # Adapted from https://unix.stackexchange.com/a/176885/347104
  # Create session 'main' or attach to 'main' if already exists.
  tmux new-session -A -s main
end
#XServer Config
export DISPLAY=(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

#Alias
alias class="ssh cheema_0856412@server.lawtonsclass.com"
alias b='sudo apt update -y;sudo apt upgrade -y;sudo apt clean -y;sudo apt autoclean -y;sudo apt autoremove -y;nvim +PlugUpdate +PlugUpgrade +TSUpdateSync +qall;$THEOS/bin/update-theos;nvm install latest;omf update;fisher update;powershell.exe choco upgrade all'
alias nic='$THEOS/bin/nic.pl'
