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

" Plugins {{{
"" Plugins managed by junegunn/vim-plug
"" Auto-installation for vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
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
    Plug 'jpalardy/vim-slime'
    
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

" Key Mappings {{{
"" Leader and easier to access command mode
let mapleader = "\<Space>"
map ; :
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

"" Easier method for indenting visual selections
vnoremap < <gv
vnoremap > >gv

"" Tab to fold code blocks
nnoremap <tab> za

"" jk to exit to normal mode.
"" J is the least used letter in the English alphabet,
"" so this mapping won't often affect normal keyboard use.
inoremap jk <esc>
" }}}

" UI Settings {{{
"" Dynamic number lines
set number
set relativenumber

"" Filetype specific plugins, syntax highlighting, and indentation
filetype on
syntax on

"" Fold settings
set foldmethod=syntax   " Decide where to fold based on syntax
set foldlevel=3         " Fold any blocks deeper than 3 indents

"" Default split directions
set splitright
set splitbelow

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
set nowrap              " Don't wrap lines automatically
set showmatch           " Show matching parenthesis, braces, quotes, etc.
set textwidth=0         " No limit to text width of files
set noshowmode          " Vim info shown by airline
set colorcolumn=80
set noerrorbells
set showmatch
set encoding=utf-8
set scrolloff=3         " Keep a minimum of 3 rows visible below cursor
set sidescrolloff=5     " Keep a minimum of 5 columns visible beside cursor

"" Make spellcheck underline instead of discolour
function! s:SetSpellcheckColours()
    let l:group_list = ["SpellBad", "SpellCap",
                       \"SpellLocal", "SpellRare"]

    for l:highlight_group in l:group_list 
        execute 'highlight clear ' . l:highlight_group
        execute 'highlight ' . l:highlight_group . ' cterm=underline'
    endfor
endfunction

call s:SetSpellcheckColours()
" }}}

" General Settings {{{
"" Indentation settings
set tabstop=8                   " Maximum width of a tab character
set shiftwidth=4                " Size of an indent
set expandtab                   " Tab button types spaces

"" Misc.
set mouse=a                     " Enable mouse scrolling
set clipboard=unnamedplus       " Share yank buffer with system clipboard

"" Jump to the last known position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
" }}}

" Undo and Swap File Settings {{{
"" Undo command persists even after session-end
set undofile
set undolevels=1000
set undoreload=1000

"" Undo and Swap files stored in hidden file
set dir=~/.cache/vim/swaps
set undodir=~/.cache/vim/undodir
" }}}

" Plugin Settings {{{
"" Netrw
"" This is Vim's built-in file explorer
let g:netrw_banner = 0          " Hide the banner in netrw file explorer
let g:netrw_liststyle = 3
let g:netrw_winsize = 15        " Netrw takes up 15% of the current split
let g:netrw_browse_split = 2    " Opened files go to new vertical split

"" Vim-Slime
""let g:slime_target = "vimterminal"
" }}}

" Markdown File Specific Commands {{{
augroup markdown_prose
    " Clear all previous autocommands
    autocmd!
    " 'setlocal' ensures this autocmd won't affect other buffers
    autocmd FileType markdown
        \ setlocal spell |
        \ setlocal wrap |
        \ setlocal foldmethod=marker |
        \ setlocal foldlevel=0 |
        \ setlocal textwidth=79
augroup END
" }}}

" Tex File Specific Commands {{{
"" Use Zathura for PDF preview
let g:livepreview_previewer="zathura"

augroup latex_prose
    " Clear all previous autocommands
    autocmd!
    " 'setlocal' ensures this autocmd won't affect other buffers
    autocmd FileType tex
        \ setlocal spell |
        \ setlocal wrap |
        \ setlocal foldmethod=marker |
        \ setlocal foldlevel=0 |
        \ setlocal textwidth=79
    
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
