#!/bin/sh

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

if command -v vim >/dev/null 2>&1; then
    echo -e "${YELLOW}Vim já está instalado.${NC}"
    exit 0
else
    echo -e "${YELLOW}Instalando o Vim...${NC}"
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR" || exit 1
    echo -e "${YELLOW}Clonando o repositório no diretório temporário: $TEMP_DIR${NC}"
    git clone https://github.com/vim/vim.git
    ls ${PWD}
    cd "vim/src" || exit 1
    echo -e "${YELLOW}Compilando o Vim...${NC}"
    ./configure --enable-python3interp=yes --with-python3-config-dir=$(pyenv which python3 | xargs dirname)/config
    sudo make install
    rm -rf "$TEMP_DIR"
    echo -e "${GREEN}Vim instalado com sucesso!${NC}"
fi

VIM_PLUG_VIM="$HOME/.vim/autoload/plug.vim"
VIM_PLUG_NVIM="$HOME/.local/share/nvim/site/autoload/plug.vim"

if [ -f "$VIM_PLUG_VIM" ] || [ -f "$VIM_PLUG_NVIM" ]; then
    echo -e "${YELLOW}vim-plug já está instalado, continuando...${NC}"
else
    echo -e "${YELLOW}Instalando vim-plug...${NC}"

    curl -fLo "$VIM_PLUG_VIM" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    curl -fLo "$VIM_PLUG_NVIM" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo -e "${YELLOW}Baixando o arquivo de configuração .vimrc...${NC}"
curl -Lo ~/.vimrc https://raw.githubusercontent.com/pedrohsbarbosa99/dotfiles/main/vim/vimrc

echo -e "${YELLOW}Instalando os plugins do Vim...${NC}"
vim +PlugInstall +qall
