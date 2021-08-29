
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
lua << EOF
function _G.webDevIcons(path)
  local filename = vim.fn.fnamemodify(path, ':t')
  local extension = vim.fn.fnamemodify(path, ':e')
  return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end
EOF

function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction



" Telescope Config
nnoremap <silent> <Leader>/ :Telescope find_files<CR>
nnoremap <silent> <Leader>f :Telescope live_grep<CR>
nnoremap <silent> <C-f> :Telescope current_buffer_fuzzy_find<CR>

"bufferline 
"set termguicolors
lua << EOF
require'bufferline'.setup {
  options = {
    --separator_style = "slant",
    close_command = "bdelete! %d",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
    local icon = level:match("error") and "✗ " or " "
    return " " .. icon .. count
    end,
    numbers = function(opts)
    return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
    end   
  }
}
EOF
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent> <leader>2 :BufferLineCycleNext<CR>
nnoremap <silent> <leader>1 :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent> <leader>m2 :BufferLineMoveNext<CR>
nnoremap <silent> <leader>m1 :BufferLineMovePrev<CR>





" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true, -- false will disable the whole extension 
    },
    indent = {
      enable = true
    }
}
EOF
" NvimTree
noremap <space>e :NvimTreeToggle<CR>
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_icons = {
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "✗",
    \   }
    \ } 
" Lsp Compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


"Telescope
lua<<EOF
require('telescope').setup {
  --defaults = require('telescope.themes').get_dropdown {winblend=10},
  pickers = {
    current_buffer_fuzzy_find = {
      sorting_strategy = "ascending",
      }
    },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF

"git 
lua<<EOF
local neogit = require('neogit')
neogit.setup()
require('gitsigns').setup()
EOF
