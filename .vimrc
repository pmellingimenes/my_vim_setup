set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Gruvbox color theme
Plugin 'morhetz/gruvbox'

" Awesome airline plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Vim fugitive plugin
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-conflicted'
" Git gutter plugin
Plugin 'airblade/vim-gitgutter'
set updatetime=100

" Vim sensitive plugib
Plugin 'tpope/vim-sensible'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdcommenter'
Plugin 'briancollins/vim-jst'
Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on

syntax on

set autoindent
set smartindent

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

set encoding=utf-8        " Every new file will be utf-8
set fileformat=unix       " LF is default EOL for new files
set fileformats=unix,dos  " Empty files will be open as Unix

set number

" Standard js auto fix on save
function! StandardFixer()
 silent exec '!standard --fix %'
 silent e %
endfunction

autocmd bufWritePost *.js :call StandardFixer()

set autoread

autocmd QuickFixCmdPost *grep* cwindow

" Kill trainling spaces
autocmd BufWritePre * %s/\s\+$//e

" Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Set gruvbox colorscheme
colorscheme gruvbox
set background=dark

" Airline configs
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" CtrlP plugin configs
set wildignore+=*/tmp/*,*/api-docs/*,*/node_modules/*,*/compiled/*

" Buffer switching
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>

" Ggrep cursor word
nnoremap <C-G> :Ggrep "\b<C-R><C-W>\b"<CR>:cw<CR>

set hidden

let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
