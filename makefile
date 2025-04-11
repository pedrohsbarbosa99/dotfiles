.PHONY: update

update:
	echo "Atualizando arquivos de configuração..."
	if [ -d ~/.emacs.d/config ]; then cp -r ~/.emacs.d/config emacs.d/config; fi
	if [ -f ~/.emacs.d/init.el ]; then cp ~/.emacs.d/init.el emacs.d/init.el; fi
	if [ -d ~/.emacs.d/snippets ]; then cp -r ~/.emacs.d/snippets emacs.d/snippets; fi
	if [ -f ~/.vimrc ]; then cp ~/.vimrc vim/vimrc; fi
	echo "Atualização concluída!"
