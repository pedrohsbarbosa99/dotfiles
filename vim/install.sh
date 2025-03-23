if [ -f "$HOME/.vim/autoload/plug.vim" ] || [ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    echo "vim-plug already installed, continue..."
else
    echo "installing vim-plug.."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


curl -Flo ~/.vimrc https://github.com/pedrohsbarbosa99/dotfiles/vim/vimrc
