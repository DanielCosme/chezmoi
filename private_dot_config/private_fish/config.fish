
# --- Sstarship ---
# - install --
# curl -fsSL https://starship.rs/install.sh | bash
# - load -
starship init fish | source

fish_vi_key_bindings

set -gx EDITOR vim
set -gx XDG_CONFIG_HOME $HOME/.config

