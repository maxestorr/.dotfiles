"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
" Config for Neovim, by Max Storr
" Date: 11.04.2019

" Plugins for Vim {{{
"" Plugins managed by junegunn/vim-plug.
"" Auto-installation for vim-plug.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Begin plugins.
call plug#begin('~/.config/nvim/plugged/')
    Plug 'altercation/vim-colors-solarized'
    Plug 'tpope/vim-surround'
    Plug 'ying17zi/vim-live-latex-preview'
    Plug 'junegunn/goyo.vim'
call plug#end()
" }}}

" Colorscheme {{{
set background=dark
colorscheme solarized
" }}}

" Key Remapping {{{
"" Cntrl + vim directional key to navigate splits.
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>
nnoremap <C-H> <C-W><C-h>
"" Easier command mode.
noremap ; :
"" Tab to fold code blocks.
nnoremap <tab> za

"" Navigating with guides:
"" Double-press semicolon in any mode to jump to the next guide.
inoremap ;; <Esc>/<++><Enter>"_c4l
vnoremap ;; <Esc>/<++><Enter>"_c4l
map ;; <Esc>/<++><Enter>"_c4l
" }}}

" Settings {{{
"" Split methods.
set splitbelow
set splitright

"" Dynamic number lines.
set number
set relativenumber

"" Filetype specific plugins, syntax highlighting, and indentation.
filetype plugin indent on
syntax on

"" Indentation settings.
set tabstop=8           " Maximum width of a tab character.
set shiftwidth=4        " Size of an indent.
set expandtab           " Tab button types spaces.

"" Fold settings.
set foldmethod=syntax   " Fold on indent.  
set foldlevel=3         " Fold any blocks deeper than 3 indents.

set conceallevel=2    " Conceal useful for markdown/latex notes.
" }}}

" Misc. Settings {{{
"" Stop colourscheme from altering opacity settings
highlight Normal ctermbg=none
highlight NonText ctermbg=none  " Non-text regions too.

"" Vim file explorer (netrw) settings.
let g:netrw_banner = 0  " Hide the banner in netrw file explorer.
let g:netrw_liststyle = 3
let g:netrw_winsize = 15

"" Modeline for vimrc folding method.
set modelines=1
"}}}

" Latex Code Snippets {{{
"" Syntax highlighting is broken here because of curlybraces in the remaps.
augroup latex_snippets
    autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
    autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
    autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
    autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
    autocmd FileType tex inoremap ;cc \cite{}<++><Esc>T{i
    autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
    autocmd FileType tex inoremap ;ref \ref{}<++><Esc>T{i
    autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
    autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
    autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
    autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0/DELRN<Enter>cgn
    autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
    autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
augroup END
" }}}

" The modeline below is executed on opening this file.
" vim:foldmethod=marker:foldlevel=0
