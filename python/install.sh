#!/bin/sh

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

if command -v pyenv >/dev/null 2>&1; then
    echo "${YELLOW}pyenv already installed!"
else
    echo "${YELLOW}Installing pyenv."
    curl -fsSL https://pyenv.run | bash
fi
