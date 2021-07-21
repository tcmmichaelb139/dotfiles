syntax on

"" ------------------ plugins ------------------- {{{"
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'                             " better commenting

" Plug 'plasticboy/vim-markdown'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'ThePrimeagen/vim-be-good'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'tweekmonster/startuptime.vim'

call plug#end()
"}}}

"" ------------------ general config ------------------- {{{"
filetype plugin indent on
set termguicolors                                                   " opaque background
set number                                                          " enables numbers to the left
set relativenumber                                                  " sets lines above and below to amount away from current line
set nohlsearch incsearch smartcase                                  " highlight text which searching
set clipboard+=unnamedplus                                          " use system clipboard by default
set hidden
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent                 " tabs indents
set expandtab
set noeb                                                             " no error bells
set scrolloff=15                                                    " scrolls the hole page when at the 10 lines from the bott
set nowrap                                                          " no wrapping when cursor gets to the end of the page
set noswapfile nobackup undofile undodir=~/.cache/nvim/undodir      " no backup file and creates an undodir for all undos
set completeopt-=preview                                            " for YCM doesn't really do anything
set splitright splitbelow                                           " open split to right and bottom
set noshowmode                                                      " doesn't show current mode and last commandk
set backspace=indent,eol,start                                      " sensible backspace
set encoding=utf-8                                                  " for vim, nvim has it by default
set title
set mouse=a
set foldmethod=marker
set nocursorline
set nocursorcolumn

set spelllang=en_us

set nowritebackup
set updatetime=50
set cmdheight=1
set signcolumn=yes

set timeoutlen=1000
set ttimeoutlen=0
set lazyredraw

set cot=menuone,noinsert,noselect shm+=c
set wildignore+=*/tmp/*,*.so,*.swp,*zip
"}}}

source $HOME/.config/nvim/themes/tokyonight.vim

set tabline=%!MyTabLine()  " {{{
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
" }}}

" statusline {{{
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
set statusline+=%#Normal#
set statusline+=\ %F
set statusline+=%{&modified?'\ [+]':''}
set statusline+=\ %r
set statusline+=%#Normal#
set statusline+=%=
set statusline+=\ %y
set statusline+=\ [%p%%]
set statusline+=\ [%l:%c]\ "
set statusline+=%#TabLineSel#
set statusline+=
"}}}

"" ------------------ keybinds/commands ------------------- " {{{

let mapleader = " "

autocmd BufNewFile,BufRead *.txt set wrap spell

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

"tabs
nnoremap <leader>n :tabn<Enter>
nnoremap <leader>p :tabp<Enter>
map <leader>tn :tabnew<space>
map <leader>tm :tabmove<space>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

"splitting
nnoremap Th :vs <bar> :vertical resize 50 <bar> :term<CR>
nnoremap Tv :split <bar> :resize -5 <bar> :term<CR>

"moveing lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

"Ctrl+backspace
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

"}}}

"lsp config {{{
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1
let g:completion_trigger_on_delete = 1

:lua << EOF
    local nvim_lsp = require('lspconfig')
    local on_attach = function(_, bufnr)
        require('completion').on_attach()
    end
    local servers = {"clangd", "vimls", "pyright", "cmake", "zeta_note"}
    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
        }
    end
EOF

:lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Enable underline, use default values
        underline = true,
        -- Enable virtual text, override spacing to 4
        virtual_text = {
            spacing = 4,
            prefix = ' ',
        },
        update_in_insert=true,
        signs = function(bufnr, client_id)
        local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
            -- No buffer local variable set, so just enable by default
            if not ok then
                return true
            end

            return result
        end,
    }
)
EOF
"}}}

"Ctrl P {{{
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
"}}}

" Notes {{{
command! -nargs=1 Ngrep lvimgrep "<args>" $HOME/Notes/**/*.txt $HOME/Notes/**/*.md
nnoremap <leader>f :Ngrep 
nnoremap <C-l> :lnext<CR>z.
nnoremap <C-h> :lpreviou<CR>z.
"}}}

" vim-Markdown {{{
let g:vim_markdown_folding_disable = 1
" }}}
