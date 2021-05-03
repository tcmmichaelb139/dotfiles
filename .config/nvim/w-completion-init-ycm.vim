syntax on

set noerrorbells
set guicursor=
set scrolloff=999
set tabstop=4 softtabstop=4
set shiftwidth=4
set nohlsearch
set expandtab
set smartindent
set smarttab
set autoindent
set expandtab
set nu
set nowrap
set smartcase
set hidden
set noswapfile
set nobackup
set undofile
set undodir=~/.config/nvim/undodir
set incsearch
set relativenumber
set completeopt-=preview
set clipboard+=unnamed
set statusline=
set cursorline
set splitright
set noshowmode

if has('python3')

endif

call plug#begin()

Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Valloric/YouCompleteMe'

call plug#end()

colorscheme gruvbox

"if executable('rg')
"    let g:rg_derive_root='true'
"endif
"

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let NERDTreeMinimalUI=1
let NERDTreeWinPos = "right"
let g:split_term_style = 'vertical'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"let g:airline_left_sep = '|'
"let g:airline_right_sep = '|'

"command! -nargs=0 Prettier :CocCommand prettier.formatFile

augroup GoAwayPreviewWindow

nnoremap <leader>c :!g++ -o a.out % -std=c++17<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
"nnoremap <leader>f :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>- :virtical resize -5<CR>
nnoremap <leader>= :virtical resize +5<CR>
"nnoremap <leader>n :tabn<Enter>
"nnoremap <leader>b :tabp<Enter>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>fa gg=G 
nnoremap <leader>t :vert term<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>


if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

