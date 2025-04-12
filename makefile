.PHONY: update

update:
	@echo "🔄 Atualizando arquivos de configuração..."

	echo "📁 Copiando ~/.emacs.d/config → emacs.d/config"; \
	rm -rf emacs.d/config; \
	cp -r ~/.emacs.d/config emacs.d; \


	echo "📄 Copiando ~/.emacs.d/init.el → emacs.d/init.el"; \
	cp ~/.emacs.d/init.el emacs.d/init.el; \

	echo "📁 Copiando ~/.emacs.d/snippets → emacs.d/snippets"; \
	rm -rf emacs.d/snippets; \
	cp -r ~/.emacs.d/snippets emacs.d; \

	echo "📄 Copiando ~/.vimrc → vim/vimrc"; \
	cp ~/.vimrc vim/vimrc; \

	@echo "✅ Atualização concluída!"
