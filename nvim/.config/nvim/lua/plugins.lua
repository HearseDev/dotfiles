local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

local packer = require 'packer'
local use = packer.use
return packer.startup {
  function(use)
    vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
  ]]
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim' --temp
    use {
      'catppuccin/nvim',
      config = function()
        vim.cmd [[colorscheme catppuccin]]
        local catppuccin = require 'catppuccin'

        -- configure it
        catppuccin.setup {
          transparent_background = false,
          term_colors = false,
          styles = {
            comments = 'italic',
            functions = 'italic',
            keywords = 'italic',
            strings = 'NONE',
            variables = 'italic',
          },
          integrations = {
            treesitter = true,
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = 'italic',
                hints = 'italic',
                warnings = 'italic',
                information = 'italic',
              },
              underlines = {
                errors = 'underline',
                hints = 'underline',
                warnings = 'underline',
                information = 'underline',
              },
            },
            lsp_trouble = false,
            cmp = true,
            lsp_saga = false,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = {
              enabled = true,
              show_root = false,
              transparent_panel = false,
            },
            neotree = {
              enabled = false,
              show_root = false,
              transparent_panel = false,
            },
            which_key = false,
            indent_blankline = {
              enabled = true,
              colored_indent_levels = true,
            },
            dashboard = false,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = false,
            lightspeed = false,
            ts_rainbow = false,
            hop = false,
            notify = false,
            telekasten = false,
          },
        }
      end,
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
              local icon = level:match 'error' and '??? ' or '??? '
              return ' ' .. icon .. count
            end,
            numbers = function(opts)
              return string.format('%s??%s', opts.raise(opts.id), opts.lower(opts.ordinal))
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
          startify.button('q', '???  Quit NVIM', ':qa<CR>'),
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
          -- indent = { enable = true },
          autopairs = { enable = true },
        }
      end,
      run = ':TSUpdate',
    }
    use {
      'windwp/nvim-ts-autotag',
      ft = 'html',
      config = function()
        require('nvim-ts-autotag').setup()
      end,
    }
    use {
      'windwp/nvim-autopairs',
      config = function()
        local npairs = require 'nvim-autopairs'

        local Rule = require 'nvim-autopairs.rule'
        npairs.setup {
          check_ts = true,
          ts_config = {
            lua = { 'string' }, -- it will not add a pair on that treesitter node
            javascript = { 'template_string' },
            java = false, -- don't check treesitter on java
          },
        }

        local ts_conds = require 'nvim-autopairs.ts-conds'

        -- press % => %% is only inside comment or string
        npairs.add_rules {
          Rule('%', '%', 'lua'):with_pair(ts_conds.is_ts_node { 'string', 'comment' }),
          Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node { 'function' }),
        }
      end,
    }
    use 'b3nj5m1n/kommentary'

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        vim.opt.termguicolors = true
        vim.opt.list = true
        vim.opt.listchars:append 'space:???'
        vim.opt.listchars:append 'eol:???'
        require('indent_blankline').setup {
          show_end_of_line = true,
          space_char_blankline = ' ',
          use_treesitter = true,
          show_current_context = true,
          buftype_exclude = { 'terminal', 'telescope' },
          filetype_exclude = { 'help', 'alpha', 'packer', 'neogitstatus', 'NvimTree' },
          -- context_patterns = { 'while', 'if', 'for', 'method', 'function', 'class', 'struct' },
          show_first_indent_level = false,
          show_trailing_blankline_indent = false,
        }
      end,
    }

    use {
      'kyazdani42/nvim-tree.lua',
      config = function()
        vim.api.nvim_set_keymap('n', '<space>e', ':NvimTreeToggle<CR>', { noremap = true })
        require('nvim-tree').setup {
          diagnostics = {
            enable = true,
            icons = {
              hint = '???',
              info = '???',
              warning = '???',
              error = '???',
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
              case_mode = 'ignore_case', -- or "ignore_case" or "respect_case"
              -- the default case_mode is "smart_case"
            },
          },
        }
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')
      end,
    }
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end,
    }
    --native lsp
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require 'nvim-cmp'
      end,

      requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        {
          'hrsh7th/vim-vsnip',
          config = function()
            vim.cmd [[let g:vsnip_snippet_dir = expand('~/.config/vsnip')]]
          end,
        },
        { 'hrsh7th/vim-vsnip-integ' },
        { 'hrsh7th/cmp-vsnip' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-path' },
        { 'ray-x/cmp-treesitter' },
      },
    }
    use {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require('null-ls').setup {
          sources = {
            require('null-ls').builtins.formatting.stylua,
            require('null-ls').builtins.formatting.prettierd,
          },
        }
      end,
    }
    use {
      'mhartington/formatter.nvim',
    }

    use {
      'neovim/nvim-lspconfig',
      config = function()
        require 'lsp'
      end,
    }
    use { 'williamboman/nvim-lsp-installer' }
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
}
