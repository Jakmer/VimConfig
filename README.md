# Neovim and Tmux Configs

Install nvim with version > 0.8


Copy this repository to ~/.config/ and then:

    cd ~/.config/ && mv VimConfig nvim

Set fonts

    mkdir -p ~/.local/share/fonts && cp ~/.config/nvim/nerd_font/Hack/*.ttf ~/.local/share/fonts/

Update font-cache

    fc-cache -fv && fc-list | grep "HackNerdFont"

Set this font in terminal settings (in Windows you need to install fonts outside WSL)

Copy tmux plugin manager

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

To set tmux:

    cp ~/.config/nvim/tmux/.tmux.conf ~

Source 

    tmux source-file ~/.tmux.conf

On windows append this to ~/.tmux.conf

    setw -g mode-keys vi

Append its content to your ~/.bashrc :

    terminal-configs/bashrc-config

Then

    source ~/.bashrc

And then restart terminal

    <ctrl> + S + I
    <ctrl> + S + r

Leave only neccessary (for you) lsp from ~/.config/nvim/lua/plugins/lsp-config.lua:12 and then install it to your system (apt and npm for example).

Moreover install:

    sudo apt install luarocks
    sudo apt install ripgrep
    python3 -m pip install neovim


To set clangd formatting:

    cp ~/.config/nvim/clangd-settings/.clang-format ~