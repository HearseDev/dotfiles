"Sources
lua require('impatient')
lua require('plugins')
" lua require('config')
lua require('remaster')
" Hidden for buffer
"set hidden
" Set SignColumn to Number
"set signcolumn=number
"for indentline
set nu rnu
set cursorline
set termguicolors
set ignorecase
set clipboard=unnamedplus

" Hide Builtin Vim insert status
set noshowmode
" Set shift width(tab indentation width)
" set tabstop=4       " The width of a TAB is set to 4.
"                     " Still it is a \t. It is just that
"                     " Vim will interpret it to be having
"                     " a width of 4.

" set shiftwidth=4    " Indents will have a width of 4

" set softtabstop=4   " Sets the number of columns for a TAB
" set expandtab       " Expand TABs to spaces
" set smartindent
" set smarttab
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set cindent
"Enable vim mouse support
set mouse=a
" Convert capital to lowercase keys for vim commands
:command! -bar -bang Q quit<bang>
:command! -bar -bang W write<bang>
:command WQ wq
:command Wq wq
" Split Behavior / Terminal Shortcut
set splitbelow
set splitright
"nmap <F2> :45vs<bar>term<CR>

" Auto-Completion Menu Config
set completeopt=menuone,noselect
" Folding Config
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable "no folds enabled when file opened
"set foldlevel=2
" Delete Buffers
nnoremap <silent> <leader>c :bd<CR>
nnoremap <silent> <leader><Bs> :bd!<CR>
