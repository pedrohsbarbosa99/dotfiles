call plug#begin()

" Style
Plug 'dracula/vim', { 'as': 'dracula' }


Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'davidhalter/jedi-vim'


"  C extensions for vim
Plug 'vim-scripts/c.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'rhysd/vim-clang-format'
Plug 'ludovicchabant/vim-gutentags'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-fugitive'

" Golang extensions
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()



colorscheme dracula


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR>


let NERDTreeMouseMode=2

augroup MouseInNERDTreeOnly
    autocmd!
    autocmd BufEnter NERD_tree_* set mouse=a
    autocmd BufLeave NERD_tree_* set mouse=
augroup END
set mouse=
set number

let g:coc_disable_startup_warning = 1
let g:python_highlight_all = 1
let g:ale_linters = {'python': ['flake8', 'pylint']}
nnoremap <F8> :TagbarToggle<CR>

" Configurações específicas para Go
autocmd FileType go setlocal noexpandtab  " Usa tabs em vez de espaços
autocmd FileType go setlocal tabstop=4     " Define a largura do tab como 4 espaços
autocmd FileType go setlocal softtabstop=4 " Mantém alinhamento correto ao editar
set visualbell
set t_vb=
:set mouse=a
