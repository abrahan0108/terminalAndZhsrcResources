" ================================
" Welcome to Abrahan's vimrc file
" ================================

" --------------------------------
" Plugins
" --------------------------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
let g:SimpylFold_docstring_preview=1
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary' " gc to comment out
Plugin 'pangloss/vim-javascript'
let g:ctrlp_working_path_mode = 0 " make ctrlp work from current dir
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'szw/vim-g'
Plugin 'jiangmiao/auto-pairs'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
call plug#begin()
Plug 'mattn/emmet-vim'
call plug#end()

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -------------------------
" Put the setters
" -------------------------
"
"  Split the Window
set splitbelow
set splitright
" Move between splits without mouse
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" -------------------------
"  Code Folding
" -------------------------
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" -------------------------
" PEP 8 
" -------------------------
"  only for .py files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
" For full stack indent
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 
" -------------------------
" Flagging Unnecessary Whitespace 
" -------------------------
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" -------------------------
" UTF-8 Support 
" -------------------------
set encoding=utf-8
" -------------------------
" Auto-Complete 
" -------------------------
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" -------------------------
" Virtualenv Support 
" -------------------------
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
" -------------------------
" Syntax Checking/Highlighting 
" -------------------------
let python_highlight_all=1
syntax on
" -------------------------
" Color Schemes 
" -------------------------
if has('gui_running')
  set background=dark
  colorscheme solatized 
else
  colorscheme onedark
endif
" switch between dark and light theme 
call togglebg#map("<F5>")
" -------------------------
" File Browsing 
" -------------------------
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" -------------------------
" Line Numbering 
" -------------------------
set nu
" -------------------------
" System Clipboard 
" -------------------------
set clipboard=unnamed

" -- EMMET CONFIG --
"  redefine trigger key
let g:user_emmet_leader_key=','
