local packer = require 'packer'
local use = packer.use
return packer.startup {
  function()
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim' --temp
    use {
      'marko-cerovac/material.nvim',
      config = function()
        vim.g.material_style = 'deep ocean'
        vim.cmd ':colorscheme material'
      end,
    }
    use {
      'folke/tokyonight.nvim',
      --[[ config = function()
        vim.g.tokyonight_style = 'night'
        vim.cmd ':colorscheme tokyonight'
      end, ]]
    }
    use 'kyazdani42/nvim-web-devicons'
    use {
      'nvim-lualine/lualine.nvim',
      config = function()
        require 'evil_lualine'
      end,
    } -- fork of original
    use {
      'akinsho/bufferline.nvim',
      setup = function()
        vim.api.nvim_set_keymap('n', '<Leader>m1', [[<Cmd>BufferLineMovePrev<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>m2', [[<Cmd>BufferLineMoveNext<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>1',
          [[<Cmd>BufferLineGoToBuffer 1<CR>]],
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>2',
          [[<Cmd>BufferLineGoToBuffer 2<CR>]],
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>3',
          [[<Cmd>BufferLineGoToBuffer 3<CR>]],
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>4',
          [[<Cmd>BufferLineGoToBuffer 4<CR>]],
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>5',
          [[<Cmd>BufferLineGoToBuffer 5<CR>]],
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>6',
          [[<Cmd>BufferLineGoToBuffer 6<CR>]],
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>7',
          [[<Cmd>BufferLineGoToBuffer 7<CR>]],
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>8',
          [[<Cmd>BufferLineGoToBuffer 8<CR>]],
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>9',
          [[<Cmd>BufferLineGoToBuffer 9<CR>]],
          { noremap = true, silent = true }
        )
      end,
      config = function()
        require('bufferline').setup {
          options = {
            close_command = 'bdelete! %d',
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
              local icon = level:match 'error' and '✗ ' or ' '
              return ' ' .. icon .. count
            end,
            numbers = function(opts)
              return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
            end,
          },
        }
      end,
    }
    use {
      'goolord/alpha-nvim',
      cmd = { 'Alpha' },
      setup = function()
        vim.api.nvim_set_keymap('n', '++', ':Alpha<CR>', { noremap = true, silent = true })
      end,
      config = function()
        local alpha = require 'alpha'
        local startify = require 'alpha.themes.startify'
        startify.section.header.val = { [[Neovim]] }
        startify.section.bottom_buttons.val = {
          startify.file_button('~/.config/nvim/init.vim', 'z'),
          startify.file_button('~/.config/nvim/lua/plugins.lua', 'x'),
          startify.file_button('~/.config/nvim/lua/lsp.lua', 'c'),
          startify.button('q', '  Quit NVIM', ':qa<CR>'),
        }
        alpha.setup(startify.opts)
      end,
    }
    use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } }
    use {
      'folke/lsp-trouble.nvim',
      cmd = 'LspTrouble',
      config = function()
        -- Can use P to toggle auto movement
        require('trouble').setup {
          auto_preview = false,
          auto_fold = true,
        }
      end,
    }
    use { 'voldikss/vim-floaterm', cmd = { 'Floaterm*' } }
    use {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('nvim-treesitter.configs').setup {
          highlight = {
            enable = true, -- false will disable the whole extension
          },
          indent = { enable = true },
          autopairs = { enable = true },
        }
      end,
      run = ':TSUpdate',
    }
    use 'windwp/nvim-autopairs'
    use 'b3nj5m1n/kommentary'
    use {
      'p00f/nvim-ts-rainbow',
      config = function()
        require('nvim-treesitter.configs').setup {
          rainbow = {
            enable = true,
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            colors = { '#ee82ee ', '#4b0082', '#0000ff ', '#008000', '#ffff00', '#ffa500', '#ff0000' },
          },
        }
      end,
    }
    --[[ use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        vim.opt.list = true
        vim.opt.listchars = {
          -- space = '⋅',
          eol = '↴',
        }
        require('indent_blankline').setup {
          show_end_of_line = false,
          space_char_blankline = '',
          use_treesitter = true,
          show_current_context = true,
          buftype_exclude = { 'terminal', 'telescope' },
          filetype_exclude = { 'help', 'alpha', 'packer', 'neogitstatus', 'NvimTree' },
          context_patterns = { 'while', 'if', 'for', 'method', 'function', 'class', 'struct' },
          indent_level = 4,
          show_first_indent_level = false,
          show_trailing_blankline_indent = false,
        }
      end,
    } ]]
    -- use 'Darazaki/indent-o-matic'
    use {
      'kyazdani42/nvim-tree.lua',
      cmd = { 'NvimTree*' },
      setup = function()
        vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true })
      end,
      config = function()
        require('nvim-tree').setup {
          diagnostics = {
            enable = true,
            icons = {
              hint = '',
              info = '',
              warning = '',
              error = '✗',
            },
          },
        }
      end,
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      },
      cmd = {
        'Telescope',
      },
      setup = function()
        vim.api.nvim_set_keymap('n', '<Leader>/', ':Telescope find_files<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap(
          'n',
          '<C-f>',
          ':Telescope current_buffer_fuzzy_find<CR>',
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap('n', '<Leader>qf', ':Telescope lsp_code_actions<CR>', {
          noremap = true,
          silent = true,
        })
      end,
      config = function()
        require('telescope').setup {
          pickers = {
            current_buffer_fuzzy_find = {
              sorting_strategy = 'ascending',
            },
          },
          extensions = {
            fzf = {
              fuzzy = true, -- false will only do exact matching
              override_generic_sorter = false, -- override the generic sorter
              override_file_sorter = true, -- override the file sorter
              case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
              -- the default case_mode is "smart_case"
            },
          },
        }
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension 'fzf'
      end,
    }
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end,
    }
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require 'nvim-cmp'
      end,

      requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/vim-vsnip' },
        { 'hrsh7th/cmp-vsnip' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-path' },
        { 'ray-x/cmp-treesitter' },
      },
    }
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use {
      'mhartington/formatter.nvim',
      ft = { 'logos' },
    }

    use {
      'neovim/nvim-lspconfig',
      config = function()
        require 'lsp'
      end,
    }
    use { 'williamboman/nvim-lsp-installer' }
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
}
