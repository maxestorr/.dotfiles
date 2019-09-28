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
" Author: Max Storr

" Plugins {{{
"" Plugins managed by junegunn/vim-plug
"" Auto-installation for vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Begin plugins
call plug#begin('~/.config/nvim/plugged/')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'junegunn/goyo.vim'
    Plug 'mboughaba/i3config.vim'
    
    " Colour Schemes
    Plug 'morhetz/gruvbox'
call plug#end()
" }}}

" Colour Scheme {{{
colorscheme gruvbox
set background=dark

"" Airline theme
let g:airline_theme='gruvbox'
" }}}

" Key Remapping {{{
"" Cntrl + vim directional key to navigate splits
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>
nnoremap <C-H> <C-W><C-h>

"" Navigating with guides:
"" Double-press semicolon in any mode to jump to the next guide
inoremap ;; <Esc>/<++><CR>"_c4l
vnoremap ;; <Esc>/<++><CR>"_c4l
map ;; <Esc>/<++><CR>"_c4l

"" Better indendation of code blocks
vnoremap < <gv
vnoremap > >gv

"" Easier command mode
noremap ; :
"" Tab to fold code blocks
nnoremap <tab> za
"" jj to exit to normal mode
inoremap jj <esc>
" }}}

" UI Settings {{{
"" Dynamic number lines
set number
set relativenumber

"" Filetype specific plugins, syntax highlighting, and indentation
filetype on
syntax on

"" Stop colourscheme from altering GNOME-Terminal opacity settings
highlight Normal ctermbg=none
highlight NonText ctermbg=none

"" Whenever color scheme is set, re-apply the above settings. Useful for when
"" exiting GoYo resets these UI settings.
augroup fix_colors
    autocmd!
    " When calling colorscheme, also run these commands
    autocmd ColorScheme * highlight Normal ctermbg=none |
                        \ highlight NonText ctermbg=none
augroup END

"" Misc.
set lazyredraw
set nowrap
set noshowmode
set colorcolumn=80
set noerrorbells
set showmatch
set encoding=utf-8
" }}}

" Misc. Settings {{{
"" Split methods
set splitbelow
set splitright

"" Indentation settings
set tabstop=8           " Maximum width of a tab character
set shiftwidth=4        " Size of an indent
set expandtab           " Tab button types spaces

"" Fold settings
set foldmethod=syntax
set foldlevel=3         " Fold any blocks deeper than 3 indents
" }}}

" Persistent Undo History {{{
"" Undo command persists even after session-end
set undofile
set undodir=~/.vim_undodir/
set undolevels=1000
set undoreload=1000
"}}}

" Netrw Settings {{{
"" This is Vim's built-in file explorer
let g:netrw_banner = 0          " Hide the banner in netrw file explorer
let g:netrw_liststyle = 3
let g:netrw_winsize = 15        " Netrw takes up 15% of the current split
let g:netrw_browse_split = 2    " Opened files go to new vertical split
"}}}

" Tex File Specific Commands {{{
"" Use Zathura for PDF preview
let g:livepreview_previewer="zathura"

augroup latex_code_snippets
    " Clear any previously loaded autocommands,
    " only want to use the ones defined here.
    autocmd!

    " Settings
    "" Setlocal settings only affect local buffer,
    "" won't affect open buffers that aren't .tex filetype
    autocmd FileType tex setlocal spell|
    \ setlocal wrap|
    \ setlocal foldmethod=marker|
    \ setlocal foldlevel=0

    " Key mappings{{{
    "" <buffer> so that remaps only affects the local buffer.
    "" Snippets
    """ Basic latex template
    autocmd FileType tex inoremap <buffer> ;temp <ESC>:.-1r ~/snips/latex/template<CR>

    "" Text emphasis
    autocmd FileType tex inoremap <buffer> ;bf \textbf{}<++><Esc>F}i|
    \ inoremap <buffer> ;em \emph{}<++><Esc>F}i|
    \ inoremap <buffer> ;it \textit{}<++><Esc>F}i

    "" Citations
    autocmd FileType tex inoremap <buffer> ;ct \textcite{}<++><Esc>F}i|
    \ inoremap <buffer> ;cc \cite{}<++><Esc>F}i|
    \ inoremap <buffer> ;cp \parencite{}<++><Esc>F}i|
    \ inoremap <buffer> ;ref \ref{}<++><Esc>F}i

    "" Sections
    autocmd FileType tex inoremap <buffer> ;sec \section{}<CR><CR><++><Esc>2kf}i|
    \ inoremap <buffer> ;ssec \subsection{}<CR><CR><++><Esc>2kf}i|
    \ inoremap <buffer> ;sssec \subsubsection{}<CR><CR><++><Esc>2kf}i

    " Lists
    autocmd FileType tex inoremap <buffer> ;ul \begin{itemize}<CR><CR>\end{itemize}<CR><CR><++><Esc>3kA\item<Space>|
    \ inoremap <buffer> ;ol \begin{enumerate}<CR><CR>\end{enumerate}<CR><CR><++><Esc>3kA\item<Space>
    "}}}

augroup END
" }}}

" Vimrc Fold Method {{{
set modelines=1
" vim:foldmethod=marker:foldlevel=0
