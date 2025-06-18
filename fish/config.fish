function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
    cat ~/.cache/ags/user/generated/terminal/sequences.txt
end

export EDITOR=nvim

alias v='$EDITOR'
alias vh='$EDITOR .'

alias la='ls -la'
alias ..='cd ..'
alias ...='cd ...'

alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gr='git restore'
alias grs='git restore --staged'
alias gb='git branch'
alias gc='git commit'
alias ga='git add'
alias glo='git log --oneline'

alias qo='qutebrowser -- :open'

alias sudoe='sudo -E -s'

zoxide init --cmd cd fish | source

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end
