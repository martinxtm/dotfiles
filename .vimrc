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
"Plugin 'tsony-tsonev/nerdtree-git-plugin'
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
syntax enable     " Use syntax highlighting
set hlsearch
set background=dark
set encoding=utf8
set tabstop=2
set guifont=DroidSansMono\ Nerd\ Font:h11

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Modified"  : "#528AB3",  
    \ "Staged"    : "#538B54",  
    \ "Untracked" : "#BE5849",  
    \ "Dirty"     : "#299999",  
    \ "Clean"     : "#87939A",   
    \ "Ignored"   : "#808080"   
    \ }   

colorscheme cosmic_latte

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" quit vim if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

:command NE NERDTree
nmap \ :NERDTreeToggle<CR>
vnoremap y "*y

