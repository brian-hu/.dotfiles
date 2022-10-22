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

" UTF-8
set encoding=utf8

" Plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'

" JSX syntax highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" NERD Commenter
Plug 'preservim/nerdcommenter'

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

" Toggle term
Plug 'akinsho/toggleterm.nvim', {'tag': '*', 'do': 'lua require(\"toggleterm\").setup()'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

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
let g:sonokai_style='andromeda'
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
let g:airline#extensions#tmuxline#enabled=0

" Open NERDTree
nnoremap <leader>n :NERDTreeFocus<CR> 
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Toggleterm
xnoremap <leader>s :ToggleTermSendVisualLines<CR>
"autocmd! TermOpen term:://toggleterm#* lua set_terminal_keymaps()

" Rust Setup
let g:rustfmt_autosave=1

" fzf binds
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

" coc.nvim binds

" Use tab for trigger completion with characters ahead and navigate.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction 
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap <C-f> and <C-g> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-m> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-m> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-m> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Lua require setup
autocmd VimEnter * call s:setup_lua()
function! s:setup_lua() abort
lua<<EOF

-- toggle term
require('toggleterm').setup{
  open_mapping = [[<C-q>]],
  shade_terminals = true,
  --shading_factor = 1,
  size = 17,
}

EOF
endfunction
