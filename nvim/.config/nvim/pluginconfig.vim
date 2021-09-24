
" NerdCommenter config
filetype plugin on
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle<CR>gv
" RainbowParentheses Config
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses


" Startify Config
let g:startify_bookmarks = [ {'z': '~/.config/nvim/init.vim'},{'x': '~/.config/nvim/plugs/plugins.vim'}, {'c': '~/.config/fish/config.fish'}, {'v' : '~/.tmux.conf'}, {'b': '~/.config/nvim/coc.vim'}]
nmap ++ :Startify<CR>
let g:startify_custom_header =['Neovim']

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent> <leader>2 :BufferLineCycleNext<CR>
nnoremap <silent> <leader>1 :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent> <leader>m2 :BufferLineMoveNext<CR>
nnoremap <silent> <leader>m1 :BufferLineMovePrev<CR>
