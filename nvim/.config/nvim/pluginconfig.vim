" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent> <leader>2 :BufferLineCycleNext<CR>
nnoremap <silent> <leader>1 :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent> <leader>m2 :BufferLineMoveNext<CR>
nnoremap <silent> <leader>m1 :BufferLineMovePrev<CR>

