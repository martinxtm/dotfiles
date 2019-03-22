set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lifepillar/vim-solarized8'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" Git
Plugin 'tpope/vim-fugitive'
" File browser
Bundle 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tsony-tsonev/nerdtree-git-plugin'
" Fuzzy searcher
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'benmills/vimux'
Plugin 'nightsense/cosmic_latte'

" always load vim-devicons as the last one
Plugin 'ryanoasis/vim-devicons'
call vundle#end()

set nocompatible
syntax on
filetype off
filetype plugin indent on

" turn hybrid line numbers on
set number relativenumber
set paste
syntax enable     " Use syntax highlighting
set hlsearch
set background=dark
set encoding=utf8
set tabstop=2
set guifont=DroidSansMono\ Nerd\ Font:h11
au BufNewFile,BufRead,BufReadPost *.hql set syntax=sql

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

colorscheme cosmic_latte

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" quit vim if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

com! Fjson %!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=4)"
:command NE NERDTree
nmap \ :NERDTreeToggle<CR>
vnoremap y "*y

