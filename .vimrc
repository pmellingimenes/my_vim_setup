set nocompatible              " be iMproved, required
filetype off                  " required

set directory=$HOME/.vim/swapfiles

call plug#begin()

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" Gruvbox color theme
Plug 'morhetz/gruvbox'

" Awesome airline plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim fugitive plugin
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
" Git gutter plugin
Plug 'airblade/vim-gitgutter'
set updatetime=100

" Vim sensitive plugib
Plug 'tpope/vim-sensible'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'scrooloose/nerdcommenter'
Plug 'briancollins/vim-jst'
Plug 'dense-analysis/ale'
Plug 'kchmck/vim-coffee-script'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'CoderCookE/vim-chatgpt'
Plug 'godlygeek/tabular'

call plug#end()

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
nmap <C-P> :FZF<CR>

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

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:chat_gpt_max_tokens=2000
let g:chat_gpt_session_mode=1
let g:chat_gpt_temperature = 0.7
let g:chat_gpt_model='gpt-4'
let g:chat_gpt_lang = 'English'
