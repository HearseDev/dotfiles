vim.api.nvim_command 'au BufRead,BufNewFile *.xm set filetype=logos'
vim.api.nvim_command [[autocmd FileType logos lua require'cmp'.setup.buffer {
   sources = {
     { name = 'vsnip' },
     { name = 'buffer' },
     { name = 'treesitter' },
     { name = 'path' },
   },
 }]]
vim.api.nvim_command 'let custom=""'
--cpp
vim.api.nvim_command 'autocmd FileType cpp map <silent> <buffer> <C-\\> :w <bar> FloatermNew g++ -std=c++17 % -o %:r && ./%:r <CR>'
vim.api.nvim_command 'autocmd FileType cpp map <silent> <buffer> <C-]> :w <bar> FloatermNew g++ -std=c++17 % -o %:r <CR>'
vim.api.nvim_command "autocmd FileType cpp map <silent> <buffer> <C-[> :w <bar> execute 'FloatermNew ' . custom <CR>"
--logos
vim.api.nvim_command 'autocmd FileType logos map <silent> <buffer> <C-\\> :w <bar> FloatermNew make clean && make -j8 do <CR>'
vim.api.nvim_command 'autocmd FileType logos map <silent> <buffer> <C-]> :w <bar> FloatermNew make clean && make -j8 package <CR>'
