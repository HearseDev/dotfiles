vim.api.nvim_command 'au BufRead,BufNewFile *.xm set filetype=logos'
vim.api.nvim_command [[autocmd FileType logos lua require'cmp'.setup.buffer {
   sources = {
     { name = 'vsnip' },
     { name = 'buffer' },
     { name = 'treesitter' },
     { name = 'path' },
   },
 }]]
vim.api.nvim_command 'let custom="custom"'
--cpp
vim.api.nvim_command 'autocmd FileType cpp map <silent> <buffer> <C-\\> :w <bar> FloatermNew g++ -std=c++17 % -o %:r && ./%:r <CR>'
vim.api.nvim_command 'autocmd FileType cpp map <silent> <buffer> <C-]> :w <bar> FloatermNew g++ -std=c++17 % -o %:r <CR>'
vim.api.nvim_command "autocmd FileType cpp map <silent> <buffer> <C-[> :w <bar> execute 'FloatermNew ' . custom <CR>"
--python
vim.api.nvim_command 'autocmd FileType python map <silent> <buffer> <C-\\> :w <bar> FloatermNew python % <CR>'
vim.api.nvim_command "autocmd FileType cpp map <silent> <buffer> <C-[> :w <bar> execute 'FloatermNew ' . custom <CR>"

--logos
vim.api.nvim_command 'autocmd FileType logos map <silent> <buffer> <C-\\> :w <bar> FloatermNew make clean && make -j8 do <CR>'
vim.api.nvim_command 'autocmd FileType logos map <silent> <buffer> <C-]> :w <bar> FloatermNew make clean && make -j8 package <CR>'
--[[ require('formatter').setup {
  filetype = {
    logos = {
      -- clang-format
      function()
        return {
          exe = '/home/admin/logos-format/main',
          args = { "Test.xm", vim.fn.expand('%:p:h') },
          stdin = true,
          cwd = vim.fn.expand('%:p:h'),
          ignore_exitcode = true
        }
      end,
    },
  },
} ]]
