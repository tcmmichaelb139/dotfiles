syntax on

" ------------------ plugins ------------------- "
call plug#begin()


Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dracula/vim'

Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'tpope/vim-commentary'                             " better commenting
Plug 'psliwka/vim-smoothie'                             " very smooth scrolling
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ------------------ general config ------------------- "

set termguicolors                                                   " opaque background
set mouse=a                                                         " allows mouse control
set clipboard+=                                          " use system clipboard by default
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent smartindent     " tabs indents
set smarttab expandtab                                              " tabs
set noerrorbells                                                    " no error bells
set scrolloff=10                                                    " scrolls the hole page when at the 10 lines from the bottom
set nohlsearch incsearch smartcase                                  " highlight text which searching
set number                                                          " enables numbers to the left
set nowrap                                                          " no wrapping when cursor gets to the end of the page
set nobackup undofile undodir=~/.config/nvim/undodir                " no backup file and creates an undodir for all undos
set relativenumber                                                  " sets lines above and below to amount away from current line
set completeopt-=preview                                           " for YCM doesn't really do anything
set cursorline                                                      " sets current line number instead of 0
set splitright splitbelow                                           " open split to right and bottom
set noshowmode noshowcmd                                            " doesn't show current mode and last command
set encoding=utf-8                                                  " for vim, nvim has it by default
set backspace=indent,eol,start                                      " sensible backspace
set emoji                                                           " enables emojis
set conceallevel=2                                                  " do it doesn't break indentation plugin
set showtabline=2                                                   " always show tablines

" performance tweaks
set nocursorline
set nocursorcolumn
set lazyredraw
set re=1
set synmaxcol=180
set redrawtime=10000

" required for coc set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

" ------------------ theming ------------------- "

colorscheme jellybeans          " theme for syntaxing

highlight signcolumn guibg=none
highlight LineNr guibg=none

hi CursorLineNr gui=bold guibg=none                                               " make relative number bold

" ------------------ plugin configurations ------------------- "

" airline
let g:airline_theme='onedark'
let g:airline_skip_empty_sections = 1
let g:airline_section_warning = ''
let g:airline_section_x=''
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'                        " show only file name on tabs
let airline#extensions#coc#error_symbol = '✘:'
let airline#extensions#coc#warning_symbol = '⚠:'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.dirty= ''

"coc
let g:coc_global_extensions = [
            \'coc-clangd',
            \'coc-syntax',
            \'coc-highlight',
            "\'coc-pairs',
            \]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"indentLine
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_setConceal = 1

"nerdtree
let g:NERDTreeWinPos = "right"

" ------------------ keybinds/commands ------------------- "

let mapleader = " "

augroup GoAwayPreviewWindow

autocmd FileType cpp nnoremap <leader>c :!g++ -o a.out % -std=c++17<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>            \'coc-pairs',
96

nnoremap <leader>u :UndotreeShow<CR>
"nnoremap <leader>f :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>- :virtical resize -5<CR>
nnoremap <leader>= :virtical resize +5<CR>
nnoremap <leader>n :tabn<Enter>
nnoremap <leader>b :tabp<Enter>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <C-c> :bd!<CR>
nnoremap T :vs <bar> :term<CR>
"nnoremap T :split <bar> :resize -5 <bar> :term<CR>                 " use if there are small screen
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

"coc mappings config
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
 
