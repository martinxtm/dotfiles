set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" Git
Plugin 'tpope/vim-fugitive'
" File browser
Bundle 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
" Fuzzy searcher
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'benmills/vimux'
Plugin 'nightsense/cosmic_latte'
" copy code to REPL
Plugin 'jpalardy/vim-slime'
" python
" Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" always load vim-devicons as the last one
Plugin 'ryanoasis/vim-devicons'
call vundle#end()

set nocompatible
syntax on
filetype off
filetype plugin indent on

" turn hybrid line numbers on
set number relativenumber
syntax enable     " Use syntax highlighting
set hlsearch
set background=dark
set encoding=utf8
set mouse=a
set guifont=DroidSansMono\ Nerd\ Font:h14
set backspace=indent,eol,start
set paste
set clipboard=unnamed
set laststatus=2
set statusline=%f
set cursorline
set tabstop=2
set sts=2
set expandtab
let mapleader = " "
let maplocalleader = "\\"
vnoremap <c-d> "_d
vnoremap <c-p> "_dP
" search selection with //
vnoremap // y/<C-R>"<CR>
nmap <c-n> :NERDTreeToggle<CR>
" read .hql files as .sql 
au BufNewFile,BufRead,BufReadPost *.hql set syntax=sql
au BufNewFile,BufRead,BufReadPost *.siddhi set syntax=sql

" tabs configuration for python files
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

colorscheme cosmic_latte

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" quit vim if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

com! JQ %!python -m json.tool
:command NE NERDTree

" vim cmd line
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_dont_ask_default = 1

" CtrlPfuzzy search
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_regexp = 0

