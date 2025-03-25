#!/bin/sh

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}Oh My Zsh is already installed.${NC}"
else
    echo -e "${GREEN}Installing Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [ -d "$HOME/.oh-my-zsh/themes/dracula" ]; then
    echo -e "${YELLOW}Dracula theme is already installed.${NC}"
else
    echo -e "${GREEN}Downloading and applying Dracula theme...${NC}"
    git clone https://github.com/dracula/zsh.git $HOME/.oh-my-zsh/themes/dracula
    ln -sf $HOME/.oh-my-zsh/themes/dracula/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme
fi

if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo -e "${YELLOW}Plugin zsh-autosuggestions is already installed.${NC}"
else
    echo -e "${GREEN}Installing zsh-autosuggestions...${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo -e "${YELLOW}Plugin zsh-syntax-highlighting is already installed.${NC}"
else
    echo -e "${GREEN}Installing zsh-syntax-highlighting...${NC}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if grep -q 'ZSH_THEME="dracula"' "$HOME/.zshrc"; then
    echo -e "${YELLOW}Dracula theme is already configured in .zshrc.${NC}"
else
    echo -e "${GREEN}Configuring Dracula theme in ~/.zshrc...${NC}"
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="dracula"/g' "$HOME/.zshrc"
fi

if grep -q 'plugins=(.zsh-autosuggestions.*zsh-syntax-highlighting.)' "$HOME/.zshrc"; then
    echo -e "${YELLOW}Plugins are already configured in .zshrc.${NC}"
else
    echo -e "${GREEN}Adding plugins to ~/.zshrc...${NC}"
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' "$HOME/.zshrc"
fi

if [ "$SHELL" == *"zsh"* ]; then
    echo -e "${GREEN}Changing default shell to Zsh...${NC}"
    chsh -s "$(which zsh)"
else
    echo -e "${YELLOW}Zsh is already the default shell.${NC}"
fi

echo -e "${GREEN}Installation complete! Restart the terminal or run 'zsh' to use.${NC}"
