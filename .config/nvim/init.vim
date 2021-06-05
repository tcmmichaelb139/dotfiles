syntax on

" ------------------ plugins ------------------- "
call plug#begin()


Plug 'sheerun/vim-polyglot'                             " nice syntax highlighting
Plug 'dracula/vim'                                      " dracula theme
Plug 'ghifarit53/tokyonight-vim'
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'

Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'tpope/vim-commentary'                             " better commenting
Plug 'psliwka/vim-smoothie'                             " very smooth scrolling
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tweekmonster/startuptime.vim'

call plug#end()

" ------------------ general config ------------------- "
filetype plugin indent on
set gfn=Fixedsys:h10
set termguicolors                                                   " opaque background
set clipboard+=unnamedplus                                          " use system clipboard by defaul
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent                 " tabs indents
set expandtab
set noerrorbells                                                    " no error bells
set scrolloff=10                                                    " scrolls the hole page when at the 10 lines from the bottom
set nohlsearch incsearch smartcase                                  " highlight text which searching
set number                                                          " enables numbers to the left
set nowrap                                                          " no wrapping when cursor gets to the end of the page
set nobackup undofile undodir=~/.config/nvim/undodir                " no backup file and creates an undodir for all undos
" set relativenumber                                                  " sets lines above and below to amount away from current line
set completeopt-=preview                                            " for YCM doesn't really do anything
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

"colorscheme
let g:tokyonight_style = "storm"
colorscheme tokyonight  

set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine() " acclamation to avoid conflict
    let s = '' " complete tabline goes here
    " loop through each tab page
    for t in range(tabpagenr('$'))
        " set highlight
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        " set page number string
        let s .= t + 1 . ' '
        " get buffer names and statuses
        let n = ''      "temp string for buffer names while we loop and check buftype
        let m = 0       " &modified counter
        let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
        " loop through each buffer in a tab
        for b in tabpagebuflist(t + 1)
            " buffer types: quickfix gets a [Q], help gets [H]{base fname}
            " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
            elseif getbufvar( b, "&buftype" ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            " check and ++ tab's &modified count
            if getbufvar( b, "&modified" )
                let n .= ' [+]'
                " let m += 1
            endif
            " no final ' ' added...formatting looks better done later
            if bc > 1
                let n .= ' | '
            endif
            let bc -= 1
        endfor
        " add modified label [n+] where n pages in tab are modified
        if m > 0
            let s .= '[' . m . '+] '
        endif
        " select the highlighting for the buffer names
        " my default highlighting only underlines the active tab
        " buffer names.
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " add buffer names
        if n == ''
            let s.= '[No Name]'
        else
            let s .= n
        endif
        " switch to no underlining and add final space to buffer list
        let s .= ' '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLineFill#%999Xclose'
    endif
    return s
endfunction

hi CursorLineNr gui=bold                                            " make relative number bold

" ------------------ plugin configurations ------------------- "

" statusline
let g:currentmode={
            \ 'n'  : 'Normal',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ "\<C-V>" : 'V·Block',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 't'  : 'Terminal',
            \}
set statusline=
set statusline+=%#TabLineSel#
set statusline+=\ %{toupper(g:currentmode[mode()])}\ "
set statusline+=%#StatusLine#
set statusline+=\ %F
set statusline+=%{&modified?'\ [+]':''}
set statusline+=\ %r
set statusline+=%#Normal#
set statusline+=%=
set statusline+=%#StatusLine#
set statusline+=\ %y
set statusline+=\ [%p%%]
set statusline+=\ [%l:%c]\ "
set statusline+=%#TabLineSel#
set statusline+=

"indentLine
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_setConceal = 1

"nerdtree
let g:NERDTreeWinPos = "right"

" ------------------ keybinds/commands ------------------- "

let mapleader = " "

"compile C++ code
autocmd FileType cpp nnoremap <leader>c :w <bar> !g++ -o a.out % -std=c++17<CR>

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

"movement keybinds
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"undotree
nnoremap <leader>u :UndotreeShow<CR>

"nerdtree
nnoremap <leader>f :NERDTreeToggle<CR>

"sizing
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= :vertical resize +5<CR>

"tabs
nnoremap <leader>n :tabn<Enter>
nnoremap <leader>p :tabp<Enter>
map <leader>tn :tabnew<space>
map <leader>tm :tabmove<space>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
" nnoremap <leader>n :bnext<CR>
" nnoremap <leader>p :bprevious<CR>
" nnoremap <leader>tc :bd!<CR>

"splitting
nnoremap Th :vs <bar> :term<CR>
nnoremap Tv :split <bar> :resize -5 <bar> :term<CR>

"moveing lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

"Ctrl+backspace
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

"coc
let g:coc_global_extensions = [
            \'coc-clangd',
            \'coc-syntax',
            \'coc-highlight',
            \'coc-vimlsp',
            \'coc-python',
            \]

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
