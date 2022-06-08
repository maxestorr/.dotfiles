"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
" Config for Neovim
" Author: maxestorr@github.com

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Auto-installation for vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin plugins
call plug#begin('~/.config/nvim/plugged/')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    "Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    "Plug 'junegunn/goyo.vim'
    "Plug 'mboughaba/i3config.vim'
    Plug 'jpalardy/vim-slime'
    
    " Colour Schemes
    Plug 'morhetz/gruvbox'
call plug#end()

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set background=dark
set number
set relativenumber
set splitright
set splitbelow
set scrolloff=8
set sidescrolloff=8
set tabstop=8
set shiftwidth=4
set expandtab
set nowrap
set showmatch
set colorcolumn=80
set noerrorbells
set ignorecase
set smartcase
set clipboard=unnamedplus 
set undofile
set undolevels=1000
set undoreload=1000
set dir=~/.cache/vim/swaps
set undodir=~/.cache/vim/undodir
filetype on
filetype plugin on
syntax on
colorscheme gruvbox

set path+=**
set hidden
set wildmode=longest:full,full
set signcolumn=yes:2

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

" Leader and easier to access command mode
let mapleader = "\<space>"
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Cntrl + vim directional key to navigate splits
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>
nnoremap <C-H> <C-W><C-h>


" Sensible operations
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z 
vnoremap < <gv
vnoremap > >gv

" jk to exit insert mode
inoremap jk <esc>

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

" Airline theme
let g:airline_theme='gruvbox'
set noshowmode

" Stop colourscheme from altering terminal opacity settings
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" Netrw settings
let g:netrw_banner = 0          " Hide the banner in netrw file explorer
let g:netrw_liststyle = 3
let g:netrw_winsize = 15        " Netrw takes up 15% of the current split
let g:netrw_altv = 1
let g:netrw_browse_split = 4    " Opened files go to new vertical split
let g:netrw_keepdir = 0

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif 

