#!/bin/sh

VIM_PLUG_VIM="$HOME/.vim/autoload/plug.vim"
VIM_PLUG_NVIM="$HOME/.local/share/nvim/site/autoload/plug.vim"

if [ -f "$VIM_PLUG_VIM" ] || [ -f "$VIM_PLUG_NVIM" ]; then
    echo "vim-plug already installed, continue..."
else
    echo "installing vim-plug..."

    curl -fLo "$VIM_PLUG_VIM" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    curl -fLo "$VIM_PLUG_NVIM" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

curl -Lo ~/.vimrc https://raw.githubusercontent.com/pedrohsbarbosa99/dotfiles/main/vim/vimrc

