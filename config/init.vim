set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required

" Install a plugin manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-smooth-scroll'
call plug#end()
" Use :PluginInstall to install plugins

" Essential configuration
" Set standard file ncoding
set encoding=utf8
" No special per file vim override configs
set nomodeline
" Stop word wrapping
set nowrap
  " Except... on Markdown. That's good stuff.
  autocmd FileType markdown setlocal wrap
" Adjust system undo levels
set undolevels=100
" Use system clipboard
set clipboard=unnamed
" Set tab width and convert tabs to spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells
" Number gutter
set number
" Use search highlighting
set hlsearch
" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5
" A visual hint for optimal column width
set colorcolumn=80
" Tab switching
noremap <S-H> gT
noremap <S-L> gt
" Window switching
noremap <C-J> <C-W>j<C-W>
noremap <C-K> <C-W>k<C-W>
noremap <C-L> <C-W>l<C-W>
noremap <C-H> <C-W>h<C-W>

set clipboard+=unnamedplus

" Fix weird symbols at the beginning of lines
set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor="

" Choose a color scheme provided by vim-colorschemes
colorscheme molokai

" Config NERDTree for viewing file directories
let g:NERDTreeWinSize=35
let g:NERDTreeQuitOnOpen=0
noremap <F3> :NERDTreeToggle .<CR>

" Config fzf for fuzzy file search
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <M-p> :Buffers<cr>

" Smooth scroll
noremap <silent> <C-U> :call smooth_scroll#up(&scroll, 15, 2)<CR>
noremap <silent> <C-D> :call smooth_scroll#down(&scroll, 15, 2)<CR>

