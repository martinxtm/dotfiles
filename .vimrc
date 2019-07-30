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
" especially useful for python autocompletion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" SQL formatter
Plugin 'Chiel92/vim-autoformat'
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
set mouse=a
set guifont=DroidSansMono\ Nerd\ Font:h11
au BufNewFile,BufRead,BufReadPost *.hql set syntax=sql
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" recommended for django 
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

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

let g:formatdef_hql= '"sqlformat  --reindent --keywords upper --identifiers lower -"'
let b:formatters_hql = ['sqlformat']
let g:formatdef_sql= '"sqlformat  --reindent --keywords upper --identifiers lower -"'
let b:formatters_sql = ['sqlformat']

colorscheme cosmic_latte
set paste

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
vnoremap <c-d> "_d
vnoremap <c-p> "_dP

