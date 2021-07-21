syntax on

"" ------------------ plugins ------------------- {{{"
call plug#begin()

Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'                             " better commenting

call plug#end()
"}}}

"" ------------------ general config ------------------- {{{"
filetype plugin indent on
set termguicolors                                                   " opaque background
set number                                                          " enables numbers to the left
set relativenumber                                                  " sets lines above and below to amount away from current line
set nohlsearch incsearch smartcase                                  " highlight text which searching
set hidden
set clipboard-=unnamedplus                                          " use system clipboard by defaul
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent                 " tabs indents
set expandtab
set noeb                                                             " no error bells
set scrolloff=15                                                    " scrolls the hole page when at the 10 lines from the bott
set noswapfile nobackup undofile undodir=~/.vim/undodir                " no backup file and creates an undodir for all undos
set splitbelow                                                      " open split to right and bottom
set splitright                                                      " open split to right and bottom
set backspace=indent,eol,start                                      " sensible backspace
set encoding=utf-8                                                  " for vim, nvim has it by default
set title
set foldmethod=marker
set nocursorline
set nocursorcolumn
set nocompatible
set nowrap

set nowritebackup
set cmdheight=1
set updatetime=50
set shortmess+=c

set timeoutlen=1000
set ttimeoutlen=0
set ttyfast
set ttimeout
set lazyredraw

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
au VimEnter * silent execute '!echo -ne "\e[2 q"' | redraw!
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set guicursor=n:block

set cot=menuone,noinsert,noselect shm+=c
set wildignore+=*/tmp/*,*.so,*.swp,*zip
"}}}

" theme {{{
source ~/.config/nvim/themes/tokyonight.vim
"}}}

"" ------------------ keybinds/commands ------------------- " {{{

let mapleader = " "

"append template to cpp files
autocmd BufNewFile *.cpp 0r $HOME/cp/Implementations/template_minimal.cpp
autocmd TerminalOpen * set wrap

"compile C++ code
autocmd FileType cpp nnoremap <leader>c :w <bar> !g++ -o %:r % -std=c++17 -O3 -Wall -lm -fsanitize=undefined<CR>
autocmd FileType cpp nnoremap <leader>r :vertical terminal ++cols=45 ./%:r <CR>

inoremap {<CR> {<CR>}<Esc>O
inoremap {} {}

"movement keybinds
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"undotree
nnoremap <leader>u :UndotreeShow<CR>

"sizing
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= :vertical resize +5<CR>

"moveing lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

"Ctrl+backspace
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
"}}}

