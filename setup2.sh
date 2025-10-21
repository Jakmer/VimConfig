#!/bin/bash

set -x

echo "Open terminal Settings -> Profile -> Text -> Custom font"
echo "Choose Hack Nerd Font Mono"
echo "---"
echo "Map CapsLock -> Ctrl"
echo "---"
echo "Load tmux plugins"
echo "Ctrl + s + I"

~/.tmux/plugins/tpm/bin/install_plugins
