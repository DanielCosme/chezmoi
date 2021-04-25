
# --- Sstarship ---
# - install --
# curl -fsSL https://starship.rs/install.sh | bash
# - load -
starship init fish | source

fish_vi_key_bindings
fish_user_key_bindings

set -gx EDITOR nvim
set -gx BROWSER firefox
set -gx TERMINAL alacritty
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx GOPATH $HOME/go
set -gx GOBIN $HOME/go/bin
set -gx GODOCC_STYLE dracula
set -gx GO111MODULE auto
