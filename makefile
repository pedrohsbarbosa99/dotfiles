.PHONY: sync

sync:
	@echo "🔄 Atualizando arquivos de configuração..."

	@if test -d ~/.emacs.d/config; then \
		echo "📁 Copiando ~/.emacs.d/config → emacs.d/config"; \
		rm -rf emacs.d/config; \
		cp -r ~/.emacs.d/config emacs.d; \
	fi

	@if test -f ~/.emacs.d/init.el; then \
		echo "📄 Copiando ~/.emacs.d/init.el → emacs.d/init.el"; \
		cp ~/.emacs.d/init.el emacs.d/init.el; \
	fi

	@if test -d ~/.emacs.d/snippets; then \
		echo "📁 Copiando ~/.emacs.d/snippets → emacs.d/snippets"; \
		rm -rf emacs.d/snippets; \
		cp -r ~/.emacs.d/snippets emacs.d; \
	fi

	@if test -f ~/.vimrc; then \
		echo "📄 Copiando ~/.vimrc → vim/vimrc"; \
		cp ~/.vimrc vim/vimrc; \
	fi

	@if test -d ~/.config/rofi; then \
		echo "📄 Copiando ~/.config/rofi/ → config"; \
		cp -r ~/.config/rofi config; \
	fi

	@echo "📄 Commitando alterações"; \
	git add .
	git commit -am "Update Configs"

	@echo "🚀 Enviando..."; \
	git push

	@echo "✅ Atualização concluída!"
