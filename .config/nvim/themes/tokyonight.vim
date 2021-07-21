
" let g:colors_name = "tokyonight-storm"
set background=dark

let s:red       = { "gui": "#f7768e" }
let s:orange    = { "gui": "#ff9e64" }
let s:yellow    = { "gui": "#e0af68" }
let s:green0    = { "gui": "#9ece6a" }
let s:green1    = { "gui": "#73daca" }
let s:cyan0     = { "gui": "#b4f9f8" }
let s:cyan1     = { "gui": "#2ac3de" }
let s:cyan2     = { "gui": "#7dcfff" }
let s:blue      = { "gui": "#7aa2f7" }
let s:magenta   = { "gui": "#bb9af7" }
let s:black     = { "gui": "#0f0f14" }
let s:fg0       = { "gui": "#a9b1d6" }
let s:fg1       = { "gui": "#c0caf5" }
let s:fg2       = { "gui": "#9aa5ce" }
let s:bg0       = { "gui": "#24283b" }
let s:bg1       = { "gui": "#1b1e2e" }
let s:bg2       = { "gui": "#32344a" }
let s:bg3       = { "gui": "#565f89" }
let s:bg4       = { "gui": "#1f2335" }

function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
endfunction

call s:h("Normal", { "fg": s:fg0, "bg": s:bg0 })
call s:h("Comment", { "fg": s:bg3, "gui": "italic"})
call s:h("Constant", { "fg": s:orange }) " any constant
call s:h("String", { "fg": s:green0 }) " a string constant: "this is a string"
call s:h("Character", { "fg": s:green0 }) " a character constnt: 'c', '\n'
call s:h("Number", { "fg": s:orange }) " a number constant: 234, 0xff
call s:h("Boolean", { "fg": s:orange }) " a boolean constant: TRUE, false
call s:h("Float", { "fg": s:orange }) " a floating point constant: 2.3e10
call s:h("Identifier", { "fg": s:fg0 }) " any variable name
call s:h("Function", { "fg": s:blue }) " function name (also: methods for classes)
call s:h("Statement", { "fg": s:magenta }) " any statement
call s:h("Conditional", { "fg": s:magenta }) " if, then, else, endif, switch, etc.
call s:h("Repeat", { "fg": s:magenta }) " for, do, while, etc.
call s:h("Label", { "fg": s:blue }) " case, default, etc.
call s:h("Operator", { "fg": s:blue }) " sizeof", "+", "*", etc.
call s:h("Keyword", { "fg": s:blue }) " any other keyword
call s:h("Exception", { "fg": s:magenta }) " try, catch, throw
call s:h("PreProc", { "fg": s:blue }) " generic Preprocessor
call s:h("Include", { "fg": s:cyan0 }) " preprocessor #include
call s:h("Define", { "fg": s:cyan2 }) " preprocessor #define
call s:h("Macro", { "fg": s:magenta }) " same as Define
call s:h("PreCondit", { "fg": s:blue }) " preprocessor #if, #else, #endif, etc.
call s:h("Type", { "fg": s:magenta }) " int, long, char, etc.
call s:h("StorageClass", { "fg": s:magenta }) " static, register, volatile, etc.
call s:h("Structure", { "fg": s:blue }) " struct, union, enum, etc.
call s:h("Typedef", { "fg": s:cyan2 }) " A typedef
call s:h("Special", { "fg": s:orange }) " any special symbol
call s:h("SpecialComment", { "fg": s:bg3 }) " special things inside a comment
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
call s:h("DiffAdd", { "bg": s:green1, "fg": s:black }) " diff mode: Added line
call s:h("DiffChange", { "fg": s:yellow }) " diff mode: Changed line
call s:h("DiffDelete", { "bg": s:red, "fg": s:black }) " diff mode: Deleted line
call s:h("DiffText", { "bg": s:yellow, "fg": s:black }) " diff mode: Changed text within a changed line
call s:h("ErrorMsg", { "fg": s:red }) " error messages on the command line
call s:h("VertSplit", { "fg": s:bg0, "bg": s:fg0}) " the column separating vertically split windows
call s:h("Folded", { "fg": s:bg3, "bg": s:bg4}) " line used for closed folds
call s:h("FoldColumn", { "fg": s:bg3, "bg": s:bg4}) " 'foldcolumn'
call s:h("SignColumn", {}) " column where signs are displayed
call s:h("IncSearch", { "fg": s:yellow, "bg": s:bg3 }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr", { "fg": s:bg3, "bg": s:bg4}) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", { "bg": s:bg0 }) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:blue, "gui": "underline"}) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg", {}) " 'showmode' message (e.g., -- INSERT --)
call s:h("MoreMsg", {}) " more-prompt
call s:h("NonText", { "fg": s:magenta }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Pmenu", { "bg": s:bg1 }) " Popup menu: normal item.
call s:h("PmenuSel", { "fg": s:magenta, "bg": s:bg1 }) " Popup menu: selected item.
call s:h("PmenuSbar", {}) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:fg0 }) " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:magenta }) " hit-enter prompt and yes/no questions
call s:h("QuickFixLine", {}) " Current quickfix item in the quickfix window.
call s:h("Search", { "fg": s:black, "bg": s:yellow }) " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call s:h("SpecialKey", {}) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad", { "fg": s:red, "gui": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", {}) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare", {}) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:bg0, "bg": s:fg0}) " status line of current window
call s:h("StatusLineNC", { "fg": s:bg0, "bg": s:fg0 }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("StatusLineTerm", { "fg": s:fg0, "bg": s:bg0}) " status line of current :terminal window
call s:h("StatusLineTermNC", { "fg": s:fg0, "bg": s:bg0 }) " status line of non-current :terminal window
call s:h("TabLine", { "fg": s:fg0  }) " tab pages line, not active tab page label
call s:h("TabLineFill", { "fg": s:bg0, "bg": s:bg0 }) " tab pages line, where there are no labels
call s:h("TabLineSel", { "fg": s:magenta }) " tab pages line, active tab page label
call s:h("Terminal", { "fg": s:fg0, "bg": s:bg0 }) " terminal window (see terminal-size-color)
call s:h("Title", { "fg": s:green1 }) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "bg": s:bg2 }) " Visual mode selection
call s:h("VisualNOS", { "bg": s:bg2 }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
call s:h("WildMenu", { "fg": s:black, "bg": s:blue }) " current match in 'wildmenu' completion



