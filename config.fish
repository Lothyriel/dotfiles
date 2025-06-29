set -gx EDITOR vim
set -gx VISUAL vim

function fish_greeting
    fortune -a
end

alias ls="eza -lh --group-directories-first --icons=auto"
alias lsa="ls -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias lta="lt -a"
zoxide init fish | source
set -gx PATH /opt/nvim $PATH
set -gx PATH $HOME/.fly/bin $PATH
