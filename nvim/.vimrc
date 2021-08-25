" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins with vim-plug
call plug#begin('~/.vim/plugged')

" Sonokai Theme
Plug 'sainnhe/sonokai'

" JSX syntax highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" NERD Commenter
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

" Rust
Plug 'rust-lang/rust.vim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" For plugins to load correctly
filetype plugin indent on

" Show line numbers
set number
set rnu

" Encoding
set encoding=utf-8

" Only do this if the file is compiled with support for autocommands
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
endif

" Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=80
set wrap

" Cursor motion
set scrolloff=5

" Do not skip wrapped lines
nnoremap j gj
nnoremap k gk

" Insert remapping
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Color scheme
if has('termguicolors')
    set termguicolors
endif

let g:sonokai_style='default'
let g:sonokai_enable_italic=0
let g:sonokai_disable_italic_comment=1

colorscheme sonokai

" Airline
let g:airline_theme = 'sonokai'

" Open NERDTree
nnoremap <leader>n :NERDTreeFocus<CR> 
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Rust Setup
let g:rustfmt_autosave = 1

" fzf binds
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
