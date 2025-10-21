#!/bin/bash

set -x

CONFIG_PATH="$HOME/.config/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONTS_DIR="$HOME/.local/share/fonts"

mkdir -p "$CONFIG_PATH"
mkdir -p "$FONTS_DIR"

sudo apt update
sudo apt install -y python3-pip
sudo apt install luarocks -y
sudo apt install ripgrep
sudo apt install tmux -y
sudo apt install curl -y
sudo apt install neovim -y

sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim.git
cd neovim
sudo make install

python3 -m pip install pynvim

curl -sS https://starship.rs/install.sh | sh

cp -r "$SCRIPT_DIR"/* "$CONFIG_PATH"
cp -r "$CONFIG_PATH/nerd_font/Hack/"*.ttf "$HOME/.local/share/fonts/"
cp "$CONFIG_PATH/terminal-configs/starship.toml" "$CONFIG_PATH"/..

fc-cache -fv && fc-list | grep "HackNerdFont"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp "$CONFIG_PATH/tmux/.tmux.conf" "$HOME"
tmux source-file "$HOME/.tmux.conf"
# setw -g mode-keys vi
cat "$CONFIG_PATH/terminal-configs/bashrc" >> "$HOME/.bashrc"
cp "$CONFIG_PATH/terminal-configs/bash_aliases" "$HOME"/.bash_aliases
source "$HOME/.bashrc"

python3 -m pip install neovim
cp "$CONFIG_PATH/clangd-settings/.clang-format" "$HOME"

mkdir -p $HOME/bin
cp scripts/init_cpp_project.sh $HOME/bin/
chmod +x $HOME/bin/init_cpp_project.sh

echo "Restart console"
