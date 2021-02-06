syntax on

set noerrorbells
set scrolloff=999
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set expandtab
set nu
set nowrap
set smartcase
set hidden
set noswapfile
set nobackup
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

Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'

Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme gruvbox
set background=dark
if executable('rg') 
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let NERDTreeMinimalUI=1
let g:split_term_style = 'vertical'

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

augroup GoAwayPreviewWindow

nnoremap <leader>c :!g++ -o a.out % -std=c++17<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>f :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>- :virtical resize -5<CR>
nnoremap <leader>= :virtical resize +5<CR>
nnoremap <leader>n :tabn<Enter>
nnoremap <leader>b :tabp<Enter>
nnoremap <leader>e :tabe /home/mbcp/
nnoremap <leader>v :vsplit /home/mbcp/
nnoremap <leader>fa gg=G

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

