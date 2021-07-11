
# --- Sstarship ---
# - install --
# curl -fsSL https://starship.rs/install.sh | bash
# - load -
starship init fish | source

fish_vi_key_bindings
fish_user_key_bindings

# environment
set -gx EDITOR nvim
set -gx BROWSER firefox
set -gx TERMINAL alacritty
set -gx XDG_CONFIG_HOME $HOME/.config

# Golang
set -gx GOPATH $HOME/go
set -gx GOBIN $HOME/go/bin
set -gx GODOCC_STYLE dracula
set -gx GO111MODULE auto
set -gx DOCKER_BUILDKIT 1

# node/npm
set -gx NPM_PACKAGES "$HOME/.npm-packages"
set -gx PATH $PATH $NPM_PACKAGES/bin
set -gx MANPATH $NPM_PACKAGES/share/man $MANPATH  
