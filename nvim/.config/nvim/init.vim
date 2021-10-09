"Sources
lua require('impatient')
lua require("plugins")
source $HOME/.config/nvim/pluginconfig.vim
"xm files
" au BufRead,BufNewFile *.xm set filetype=logos
" Hidden for buffer
set hidden
" Set SignColumn to Number
"set signcolumn=number
set nu rnu
set cursorline
set termguicolors
set ignorecase
set clipboard=unnamedplus

" Hide Builtin Vim insert status
set noshowmode
" Enable Line Numbers
set number
" Set shift width(tab indentation width)
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set smartindent
set smarttab
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
nmap <F2> :45vs<bar>term<CR>
" Make functions
function CompileAndRun()
  execute ':w'
  execute ':make'
  execute ':make run'
endfunction
function Compile()
  execute ':w'
  execute ':make'
endfunction
" Set Shortcut for Functions
noremap <C-\> :call CompileAndRun()<CR>
noremap <C-]> :call Compile()<CR>

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
nnoremap <F5> :source ~/.config/nvim/init.vim <CR>
