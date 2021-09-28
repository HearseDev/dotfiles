local packer = require 'packer'
local use = packer.use

return packer.startup {
  function()
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim' --temp
    use {
      'folke/tokyonight.nvim',
      config = function()
        vim.g.tokyonight_style = 'storm'
        vim.cmd ':colorscheme tokyonight'
      end,
    }
    use 'kyazdani42/nvim-web-devicons'
    use {
      'shadmansaleh/lualine.nvim',
      config = function()
        require 'evil_lualine'
      end,
    } -- fork of original
    use {
      'akinsho/bufferline.nvim',
      config = function()
        require('bufferline').setup {
          options = {
            --separator_style = "slant",
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
    use {
      'p00f/nvim-ts-rainbow',
    }
    use 'windwp/nvim-autopairs'
    use 'b3nj5m1n/kommentary'
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        --[[ vim.opt.list = true
        vim.opt.listchars = {
          -- space = '⋅',
          eol = '↴',
        } ]]
        require('indent_blankline').setup {
          show_end_of_line = false,
          space_char_blankline = '',
          use_treesitter = true,
          show_current_context = true,
          buftype_exclude = { 'terminal', 'telescope' },
          filetype_exclude = { 'help', 'alpha', 'packer', 'neogitstatus', 'NvimTree' },
          context_patterns = { 'while', 'if', 'for', 'method', 'function', 'class', 'struct' },
          indent_level = 4,
          --let g:indent_blankline_show_first_indent_level = v:false
          show_trailing_blankline_indent = false,
        }
      end,
    }
    use 'Darazaki/indent-o-matic'
    use {
      'kyazdani42/nvim-tree.lua',
      cmd = { 'NvimTree*' },
      setup = function()
        vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true })
      end,
      config = function()
        vim.g.nvim_tree_lsp_diagnostics = true
        vim.g.nvim_tree_icons = {
          lsp = {
            hint = '',
            info = '',
            warning = '',
            error = '✗',
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
        vim.api.nvim_set_keymap('n', '<Leader>qf', ':Telescope lsp_code_actions<CR>', { noremap = true, silent = true })
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
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require 'lsp'
      end,
    }
    use { 'kabouzeid/nvim-lspinstall' }
    use { 'jose-elias-alvarez/null-ls.nvim' }
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
}