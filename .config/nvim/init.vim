syntax on

"" ------------------ plugins ------------------- {{{"
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'                             " better commenting

Plug 'ThePrimeagen/vim-be-good'

" Plug 'dstein64/vim-startuptime'
Plug 'tweekmonster/startuptime.vim'

call plug#end()
"}}}

"" ------------------ general config ------------------- {{{"
set termguicolors                                                   " opaque background
set number                                                          " enables numbers to the left
set relativenumber                                                  " sets lines above and below to amount away from current line
set nohlsearch incsearch smartcase                                  " highlight text which searching
set clipboard+=unnamedplus                                          " use system clipboard by defaul
set hidden
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent                 " tabs indents
set expandtab
set noeb                                                             " no error bells
set scrolloff=15                                                    " scrolls the hole page when at the 10 lines from the bott
set nowrap                                                          " no wrapping when cursor gets to the end of the page
set noswapfile nobackup undofile undodir=~/.cache/nvim/undodir                " no backup file and creates an undodir for all undos
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

set nowritebackup
set cmdheight=2
set updatetime=50
set shortmess+=c
set signcolumn=yes

set timeoutlen=1000
set ttimeoutlen=0
set lazyredraw

set cot=menuone,noinsert,noselect shm+=c
"}}}

" theme {{{
" let g:colors_name = "tokyonight-storm"
set background=dark

let s:red       = { "gui": "#f7768e", "cterm": "203" }
let s:number    = { "gui": "#ff9e64", "cterm": "215" }
let s:yellow    = { "gui": "#e0af68", "cterm": "179" }
let s:strclass  = { "gui": "#9ece6a", "cterm": "107" }
let s:green     = { "gui": "#73daca", "cterm": "107" }
let s:litstr    = { "gui": "#b4f9f8", "cterm": "" }
let s:support   = { "gui": "#2ac3de", "cterm": "" }
let s:cyan      = { "gui": "#7dcfff", "cterm": "" }
let s:blue      = { "gui": "#7aa2f7", "cterm": "110" }
let s:magenta   = { "gui": "#bb9af7", "cterm": "176" }
let s:white     = { "gui": "#c0caf5", "cterm": "15" }
let s:fg        = { "gui": "#a9b1d6", "cterm": "250" }
let s:markdown  = { "gui": "#9aa5ce", "cterm": "" }
let s:visual    = { "gui": "#32344a", "cterm": "237" }
let s:comment   = { "gui": "#565f89", "cterm": "" }
let s:black     = { "gui": "#414868", "cterm": "" }
let s:bg        = { "gui": "#24283b", "cterm": "" }
let s:popupbg   = { "gui": "#1b1e2e", "cterm": "" }
let s:nbg       = { "gui": "#1a1b26", "cterm": ""}

let s:check     = { "gui": "#ffffff", "cterm": "" }

function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        " \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        " \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        " \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal", { "fg": s:fg })
call s:h("Comment", { "fg": s:comment, "gui": "italic"}) ", "cterm": "italic" }) " any comment
call s:h("Constant", { "fg": s:number }) " any constant
call s:h("String", { "fg": s:strclass }) " a string constant: "this is a string"
call s:h("Character", { "fg": s:strclass }) " a character constnt: 'c', '\n'
call s:h("Number", { "fg": s:number }) " a number constant: 234, 0xff
call s:h("Boolean", { "fg": s:number }) " a boolean constant: TRUE, false
call s:h("Float", { "fg": s:number }) " a floating point constant: 2.3e10
call s:h("Identifier", { "fg": s:fg }) " any variable name
call s:h("Function", { "fg": s:blue }) " function name (also: methods for classes)
call s:h("Statement", { "fg": s:magenta }) " any statement
call s:h("Conditional", { "fg": s:magenta }) " if, then, else, endif, switch, etc.
call s:h("Repeat", { "fg": s:magenta }) " for, do, while, etc.
call s:h("Label", { "fg": s:blue }) " case, default, etc.
call s:h("Operator", { "fg": s:cyan }) " sizeof", "+", "*", etc.
call s:h("Keyword", { "fg": s:blue }) " any other keyword
call s:h("Exception", { "fg": s:magenta }) " try, catch, throw
call s:h("PreProc", { "fg": s:blue }) " generic Preprocessor
call s:h("Include", { "fg": s:cyan }) " preprocessor #include
call s:h("Define", { "fg": s:cyan }) " preprocessor #define
call s:h("Macro", { "fg": s:magenta }) " same as Define
call s:h("PreCondit", { "fg": s:blue }) " preprocessor #if, #else, #endif, etc.
call s:h("Type", { "fg": s:magenta }) " int, long, char, etc.
call s:h("StorageClass", { "fg": s:magenta }) " static, register, volatile, etc.
call s:h("Structure", { "fg": s:blue }) " struct, union, enum, etc.
call s:h("Typedef", { "fg": s:cyan }) " A typedef
call s:h("Special", { "fg": s:number }) " any special symbol
call s:h("SpecialComment", { "fg": s:comment }) " special things inside a comment
call s:h("Debug", {}) " debugging statements
call s:h("Underlined", { "gui": "underline" }) " text that stands out, HTML links
call s:h("Ignore", {}) " left blank, hidden
call s:h("Error", { "fg": s:red }) " any erroneous construct
call s:h("Todo", { "fg": s:magenta }) " anything that needs extra attention; mostly the keywords TODO FIXME and XXX


call s:h("ColorColumn", {}) " used for the columns set with 'colorcolumn'
call s:h("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", {}) " the character under the cursor
call s:h("CursorLine", {})
call s:h("CursorIM", {}) " like Cursor, but used when in IME mode
call s:h("CursorColumn", {}) " the screen column that the cursor is in when 'cursorcolumn' is set
call s:h("Directory", { "fg": s:blue }) " directory names (and other special names in listings)
call s:h("DiffAdd", { "bg": s:green, "fg": s:black }) " diff mode: Added line
call s:h("DiffChange", { "fg": s:yellow }) " diff mode: Changed line
call s:h("DiffDelete", { "bg": s:red, "fg": s:black }) " diff mode: Deleted line
call s:h("DiffText", { "bg": s:yellow, "fg": s:black }) " diff mode: Changed text within a changed line
call s:h("ErrorMsg", { "fg": s:red }) " error messages on the command line
call s:h("VertSplit", { "fg": s:nbg }) " the column separating vertically split windows
call s:h("Folded", { "fg": s:comment }) " line used for closed folds
call s:h("FoldColumn", { "fg": s:comment }) " 'foldcolumn'
call s:h("SignColumn", {}) " column where signs are displayed
call s:h("IncSearch", { "fg": s:yellow, "bg": s:comment }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr", { "fg": s:comment }) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", { "bg": s:bg }) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:blue, "gui": "underline"}) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg", {}) " 'showmode' message (e.g., -- INSERT --)
call s:h("MoreMsg", {}) " more-prompt
call s:h("NonText", { "fg": s:magenta }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Pmenu", { "bg": s:popupbg }) " Popup menu: normal item.
call s:h("PmenuSel", { "fg": s:magenta, "bg": s:popupbg }) " Popup menu: selected item.
call s:h("PmenuSbar", {}) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:fg }) " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:magenta }) " hit-enter prompt and yes/no questions
call s:h("QuickFixLine", {}) " Current quickfix item in the quickfix window.
call s:h("Search", { "fg": s:black, "bg": s:yellow }) " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call s:h("SpecialKey", {}) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad", { "fg": s:red, "gui": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", {}) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare", {}) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:fg, "bg": s:bg}) " status line of current window
call s:h("StatusLineNC", { "fg": s:comment }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("StatusLineTerm", { "fg": s:fg }) " status line of current :terminal window
call s:h("StatusLineTermNC", { "fg": s:comment }) " status line of non-current :terminal window
call s:h("TabLine", { "fg": s:fg }) " tab pages line, not active tab page label
call s:h("TabLineFill", {}) " tab pages line, where there are no labels
call s:h("TabLineSel", { "fg": s:magenta }) " tab pages line, active tab page label
call s:h("Terminal", { "fg": s:white, "bg": s:black }) " terminal window (see terminal-size-color)
call s:h("Title", { "fg": s:green }) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "bg": s:visual }) " Visual mode selection
call s:h("VisualNOS", { "bg": s:visual }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
call s:h("WildMenu", { "fg": s:black, "bg": s:blue }) " current match in 'wildmenu' completion

"}}}

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
"}}}

"" ------------------ keybinds/commands ------------------- " {{{

let mapleader = " "

"compile C++ code
autocmd FileType cpp nnoremap <leader>cc :w <bar> !g++ -o a.out % -std=c++17 -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -fsanitize=undefined<CR>

"compile and run {{{
function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	exec buffercmd
	exec 'term ' . a:command
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec 'setlocal nornu nonu'
	exec 'startinsert'
endfunction 
" }}}

let g:split_term_style = 'horizontal'
let g:split_term_resize_cmd = 'resize 20'

command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++17 %s -O2 -Wall -fsanitize=undefined && ./a.out', expand('%')))
command! -nargs=1 CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++17 %s && ./a.out < %s', expand('%'), <args>))
autocmd FileType cpp nnoremap <leader>cr :w <bar> :CompileAndRun<CR>

autocmd BufNewFile,BufRead *.txt set wrap

augroup numbertoggle " {{{
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END
" }}} 

inoremap {<Enter> {<CR>}<Esc>O

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
" nnoremap <leader>n :bnext<CR>
" nnoremap <leader>p :bprevious<CR>
" nnoremap <leader>tc :bd!<CR>

"splitting
nnoremap Th :vs <bar> :term<bar> :resize 20<CR>
nnoremap Tv :split <bar> :resize -5 <bar> :term<CR>

"moveing lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

"Ctrl+backspace
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
    local servers = {'clangd'}
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

