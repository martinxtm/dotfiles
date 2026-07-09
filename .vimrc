set nocompatible

" --------------------
" Core settings
" --------------------
syntax enable
filetype plugin indent on

set number
set relativenumber
set hlsearch
set mouse=a
set encoding=utf-8
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

" --------------------
" Mappings
" --------------------
vnoremap <C-d> "_d
vnoremap <C-p> "_dP
vnoremap // y/<C-R>"<CR>

" --------------------
" Tmux-friendly navigation
" --------------------
if exists("$TMUX")
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
endif

" --------------------
" Filetype overrides
" --------------------
autocmd BufNewFile,BufRead *.hql setfiletype sql
autocmd BufNewFile,BufRead *.siddhi setfiletype sql
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" --------------------
" Commands
" --------------------
command! JQ %!python3 -m json.tool
