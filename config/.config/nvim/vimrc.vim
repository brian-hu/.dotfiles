" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" UTF-8
set encoding=utf8

" For plugins to load correctly
filetype plugin indent on

" Show line numbers
set number
set rnu

" Encoding
set encoding=utf-8

" Use filetype detection and file-based automatic indenting.
filetype plugin indent on

" Use actual tab chars in Makefiles.
autocmd FileType make set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab

" Use tabstop of 2 in HTML
autocmd FileType html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Use tabstop of 2 in XML
autocmd FileType xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Use tabstop of 2 in YAML
autocmd FileType yml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Use tabstop of 2 in C++
autocmd FileType cpp set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType hpp set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Use tabstop of 2 in lua
autocmd FileType lua set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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

" Gruvbox-material settings
set background=dark
let g:gruvbox_material_background='medium'
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_enable_italic=0
let g:gruvbox_material_disable_italic_comment=1

" Sonokai settings
let g:sonokai_style='shusia'
let g:sonokai_better_performance=1
let g:sonokai_enable_italic=0
let g:sonokai_disable_italic_comment=1

" Everforest
let g:everforest_background='medium'
let g:everforest_enable_italic=0
let g:everforest_disable_italic_comment=1

colorscheme sonokai

" Airline
let g:airline_theme='sonokai'
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled=1
let airline#extensions#tmuxline#snapshot_file = "~/.tmuxstatus.conf"

" fzf binds
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

" Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
