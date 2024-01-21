# --- Sstarship (promtp) ---
# - install --
# curl -fsSL https://starship.rs/install.sh | bash
# - load -
starship init fish | source

fish_vi_key_bindings
fish_user_key_bindings

set fish_greeting

# environment
set -gx EDITOR nvim
set -gx BROWSER firefox
set -gx TERMINAL kitty
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_USER_CONFIG_DIR $XDG_CONFIG_HOME
# set -gx XDG_DATA_HOME $HOME/.local
set -gx PAGER bat
set -gx SSH_TTY dummy # to show hostname on remote machines

# Golang
set -gx GOPATH $HOME/go
set -gx GOBIN $HOME/go/bin
set -gx PATH $PATH $GOBIN
set -gx PATH $PATH /usr/local/go/bin
set -gx GODOCC_STYLE dracula
set -gx GO111MODULE on
set -gx DOCKER_BUILDKIT 1

# Rust
set -gx CARGO_BIN $HOME/.cargo/bin
set -gx PATH $PATH $CARGO_BIN

# Ruby
if command -q gem
    set -gx GEM_HOME $(gem env gemhome)
    set -gx PATH $PATH "$GEM_HOME/bin"
end

# node/npm
set -gx NPM_PACKAGES "$HOME/.npm_packages"
set -gx PATH $PATH $NPM_PACKAGES/bin
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
if test -d $NPM_PACKAGES/share/man
    if not contains -- $NPM_PACKAGES/share/man $MANPATH
        set -gx MANPATH $NPM_PACKAGES/share/man $MANPATH
    end
end
if test ! -d "$HOME/.npm_packages"
    mkdir "$HOME/.npm_packages"
end

# Neovim
alias vi='nvim'
abbr -a nv neovide

# Git
alias glog='git log --all --graph --decorate --oneline'
alias gb='git branch -vv'
abbr -a gs git status
abbr -a ga git add
abbr -a gc  git commit
abbr -a gcm git commit -m
abbr -a gf  git fetch
abbr -a gcl git clone
abbr -a gco git checkout
abbr -a gp  git push
abbr -a gpl git pull
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gfc git findcommit
abbr -a gfm git findmessage
abbr -a gst git stash

abbr -a ch chezmoi
abbr -a reload exec fish

# Replace ls with exa
alias ls='exa --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lla='exa -la --color=always --group-directories-first --icons'  # long format
abbr -a lt exa -T --color=always --group-directories-first --icons --level $argv # tree listing
alias l.="exa -a | grep -E '^\.'"                                     # show only dotfiles

alias bat='bat'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias fixpacman="sudo rm /var/lib/pacman/db.lck"
# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Fish command history
function history
    builtin history --show-time='%F %T '
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Fish syntax highlighting
set -U fish_color_normal normal
set -U fish_color_command 5f8700
set -U fish_color_quote ffaf00
set -U fish_color_redirection 8700af
set -U fish_color_end 0000ff
set -U fish_color_error ff0000
set -U fish_color_param afd700
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 808080
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_match --background=brblue
set -U fish_color_comment 990000

## Starship prompt
# if status --is-interactive
#    source ("/usr/bin/starship" init fish --print-full-init | psub)
# end
