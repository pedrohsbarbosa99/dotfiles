#!/bin/bash

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Helper function
print_step() {
    echo -e "${BLUE}==>${NC} ${YELLOW}$1${NC}"
}

print_success() {
    echo -e "${GREEN}✔ $1${NC}"
}

print_error() {
    echo -e "${RED}✖ $1${NC}"
}

# Start Script
echo -e "${GREEN}Starting setup...${NC}"

# Install NVM
print_step "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && print_success "NVM installed" || print_error "Failed to install NVM"

# Load NVM into shell
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js
print_step "Installing Node.js..."
nvm install node && print_success "Node.js installed" || print_error "Failed to install Node.js"

# Install global NPM packages
print_step "Installing Pyright and Marksman globally..."
npm install -g pyright marksman && print_success "Global NPM packages installed" || print_error "Failed to install global NPM packages"

# Install Pyenv
print_step "Installing Pyenv..."
curl -fsSL https://pyenv.run | bash && print_success "Pyenv installed" || print_error "Failed to install Pyenv"

# Install Oh My Zsh
print_step "Installing Oh My Zsh..."
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh && print_success "Oh My Zsh installed" || print_error "Failed to install Oh My Zsh"

# Install Zsh plugins
print_step "Installing Zsh plugins (autosuggestions and syntax highlighting)..."
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions && print_success "Zsh Autosuggestions installed" || print_error "Failed to install Zsh Autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && print_success "Zsh Syntax Highlighting installed" || print_error "Failed to install Zsh Syntax Highlighting"

# Change default shell to zsh
print_step "Changing default shell to Zsh..."
chsh -s "$(which zsh)" && print_success "Default shell changed to Zsh" || print_error "Failed to change default shell"

echo -e "${GREEN}Setup completed! Please restart your terminal.${NC}"

