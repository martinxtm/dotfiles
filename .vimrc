set nocompatible

" --------------------
" Plugins (Vundle)
" --------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Navigation / file browser
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'preservim/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" Search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Git
Plugin 'tpope/vim-fugitive'

" UI
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'nightsense/cosmic_latte'
Plugin 'ryanoasis/vim-devicons'

" REPL / tmux
Plugin 'benmills/vimux'
Plugin 'jpalardy/vim-slime'

call vundle#end()

" --------------------
" Core settings
" --------------------
syntax enable
filetype plugin indent on

set number
set relativenumber
set hlsearch
set background=dark
set encoding=utf-8
set mouse=a
set backspace=indent,eol,start
set clipboard=unnamedplus
set laststatus=2
set statusline=%f
set cursorline

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

let mapleader = " "
let maplocalleader = "\\"

" GUI only
if exists('+guifont')
  set guifont=DroidSansMono\ Nerd\ Font:h14
endif

" --------------------
" Mappings
" --------------------
vnoremap <C-d> "_d
vnoremap <C-p> "_dP
vnoremap // y/<C-R>"<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" --------------------
" Filetype overrides
" --------------------
autocmd BufNewFile,BufRead *.hql setfiletype sql
autocmd BufNewFile,BufRead *.siddhi setfiletype sql

" Python indentation
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" --------------------
" Commands
" --------------------
command! JQ %!python3 -m json.tool
command! NE NERDTree

" --------------------
" vim-devicons refresh
" --------------------
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Quit Vim if NERDTree is the only window left
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" --------------------
" vim-slime
" --------------------
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = { "socket_name": "default", "target_pane": "{right-of}" }
let g:slime_dont_ask_default = 1

" --------------------
" CtrlP
" --------------------
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_regexp = 0

colorscheme cosmic_latte
