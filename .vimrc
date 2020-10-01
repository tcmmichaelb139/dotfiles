syntax on

set noerrorbells
set scrolloff=999
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set statusline=
set relativenumber
set splitright

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
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'lyuts/vim-rtags'

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug '/home/mpaulson/personal/vim-be-good'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

Plug 'preservim/nerdtree'

call plug#end()

colorscheme gruvbox
set background=dark
if executable('rg') 
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:airline#extensions#tabline#enabled = 1
let g:netrw_banner = 0
let g:netrw_winsize = 25
let NERDTreeMinimalUI=1

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>t :below vertical terminal<CR>
nnoremap <leader>f :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>- :virtical resize -5<CR>
nnoremap <leader>= :virtical resize +5<CR>
nnoremap <leader>c :!g++ -o  %:r.out % -std=c++17<Enter>
nnoremap <leader>n :tabn<Enter>
nnoremap <leader>b :tabp<Enter>
nnoremap <leader>e :tabe /home/mcsbmath/
nnoremap <leader>v :vsplit /home/mcsbmath/
