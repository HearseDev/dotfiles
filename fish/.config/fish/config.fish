#Start tmux
if status is-interactive
# don't nest inside another tmux 
  and not set -q TMUX
  # Adapted from https://unix.stackexchange.com/a/176885/347104
  # Create session 'main' or attach to 'main' if already exists.
  tmux new-session -A -s main
end
set fish_greeting ""
#Alias
alias class="ssh cheema_0856412@server.lawtonsclass.com"
alias b='sudo apt update -y;sudo apt upgrade -y;sudo apt clean -y;sudo apt autoclean -y;sudo apt autoremove -y;$THEOS/bin/update-theos;nvm install latest;omf update;fisher update;python3 ~/.gdbinit-gef.py --update;nvim +PackerSync +TSUpdateSync'
alias nic='$THEOS/bin/nic.pl'
alias gdb='gdb -q'
# TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 33467C
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7
    
    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment
    
    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
if status is-interactive
and set -q TMUX
    tmux source-file ~/.tmux.conf
end

