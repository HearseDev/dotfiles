local packer = require("packer")
local use = packer.use

return packer.startup(function()
use 'wbthomason/packer.nvim'
use "lewis6991/impatient.nvim" --temp
use "folke/tokyonight.nvim"
use "kyazdani42/nvim-web-devicons"
use {"hoob3rt/lualine.nvim", config = function() require'evil_lualine' end}
use {"akinsho/bufferline.nvim",
    config = function()
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
end
}

use "mhinz/vim-startify"
use "jiangmiao/auto-pairs"
use "preservim/nerdcommenter"
use "junegunn/rainbow_parentheses.vim"
use "dstein64/vim-startuptime"
use "voldikss/vim-floaterm"
use {
        'nvim-treesitter/nvim-treesitter',
        config = function ()
            require'nvim-treesitter.configs'.setup {
                highlight = {
                enable = true, -- false will disable the whole extension 
                },
                indent = {enable = true}
            }
        end,
        run = ':TSUpdate'
}

use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        vim.opt.list = true
        vim.opt.listchars = {
        space = "⋅",
        eol = "↴",
        }
        require("indent_blankline").setup {
            show_end_of_line = true,
            use_treesitter = true,
            show_current_context = true,
            buftype_exclude = { "terminal", "telescope" },
            filetype_exclude = { 'help', 'startify', 'packer', 'neogitstatus', 'NvimTree'},
            context_patterns = {'while','if','for','method','function', 'class', 'struct'},
            indent_level = 4,
            --let g:indent_blankline_show_first_indent_level = v:false
            show_trailing_blankline_indent = false
    }
    end
}
use "Darazaki/indent-o-matic"
use {
    "kyazdani42/nvim-tree.lua",
    config = function()
        vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', {noremap = true})
        vim.g.nvim_tree_lsp_diagnostics = true
        vim.g.nvim_tree_icons = {
            lsp = {
                hint = "",
                info = "",
                warning = "",
                error = "✗",
            }
        }
    end
}
use {
    "nvim-telescope/telescope.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
    },
    cmd = {
      --  "Telescope"
    },
    config = function()
        require('telescope').setup {
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
        }}
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
end
}
--Telescope keybinds
vim.api.nvim_set_keymap('n', '<Leader>/', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>qf', ':Telescope lsp_code_actions<CR>', { noremap = true, silent = true })


use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
use "neovim/nvim-lspconfig"
use "kabouzeid/nvim-lspinstall"
use {
	"hrsh7th/nvim-cmp",
	requires = {
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/vim-vsnip"},
	{"hrsh7th/cmp-vsnip"},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-nvim-lua"},
	{"hrsh7th/cmp-path"},
	{"ray-x/cmp-treesitter"}
    }
}

end)
