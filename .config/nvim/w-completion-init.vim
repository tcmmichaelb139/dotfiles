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
set cmdheight=2
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
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug '/home/mpaulson/personal/vim-be-good'
Plug 'ThePrimeagen/vim-be-good'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

augroup GoAwayPreviewWindow

function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	endif
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec buffercmd
	exec 'term ' . a:command
	exec 'startinsert'
endfunction
command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++17 %s && ./a.out', expand('%')))
autocmd FileType cpp nnoremap <leader>c :CompileAndRun<CR>

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

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-python',
      \ 'coc-prettier',
      \]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-refrences)

