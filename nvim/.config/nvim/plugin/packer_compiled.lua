-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    commands = { "Alpha" },
    config = { "\27LJ\2\nâ\3\0\0\t\0\21\1'6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\5\0009\4\b\1'\6\t\0'\a\n\0B\4\3\2>\4\1\0039\4\b\1'\6\v\0'\a\f\0B\4\3\2>\4\2\0039\4\b\1'\6\r\0'\a\14\0B\4\3\2>\4\3\0039\4\15\1'\6\16\0'\a\17\0'\b\18\0B\4\4\0?\4\0\0=\3\5\0029\2\19\0009\4\20\1B\2\2\1K\0\1\0\topts\nsetup\f:qa<CR>\19Ôôô  Quit NVIM\6q\vbutton\6c\31~/.config/nvim/lua/lsp.lua\6x#~/.config/nvim/lua/plugins.lua\6z\28~/.config/nvim/init.vim\16file_button\19bottom_buttons\1\2\0\0\vNeovim\bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\tÄÄ¿ô\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2Ä'\4\2\0X\5\1Ä'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \tÔÅ± \t‚úó \nerror\nmatch[\0\1\b\0\a\0\n6\1\0\0009\1\1\1'\3\2\0009\4\3\0009\6\4\0B\4\2\0029\5\5\0009\a\6\0B\5\2\0C\1\2\0\fordinal\nlower\aid\nraise\v%s¬∑%s\vformat\vstring±\1\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\fnumbers\0\26diagnostics_indicator\0\1\0\2\16diagnostics\rnvim_lsp\18close_command\16bdelete! %d\nsetup\15bufferline\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["formatter.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n◊\3\0\0\4\0\16\0!6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0009\0\4\0\18\2\0\0009\0\5\0'\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\4\0\18\2\0\0009\0\5\0'\3\a\0B\0\3\0016\0\b\0'\2\t\0B\0\2\0029\0\n\0005\2\v\0005\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\21filetype_exclude\1\6\0\0\thelp\nalpha\vpacker\17neogitstatus\rNvimTree\20buftype_exclude\1\3\0\0\rterminal\14telescope\1\0\6\25show_current_context\2\28show_first_indent_level\1#show_trailing_blankline_indent\1\21show_end_of_line\2\25space_char_blankline\6 \19use_treesitter\2\nsetup\21indent_blankline\frequire\feol:‚Ü¥\14space:‚ãÖ\vappend\14listchars\tlist\18termguicolors\bopt\bvim\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp-trouble.nvim"] = {
    commands = { "LspTrouble" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17auto_preview\1\14auto_fold\2\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17evil_lualine\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  nvim = {
    config = { "\27LJ\2\n\5\0\0\a\0\21\0\0256\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\1\5\0005\3\6\0005\4\a\0=\4\b\0035\4\t\0005\5\n\0005\6\v\0=\6\f\0055\6\r\0=\6\14\5=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\3B\1\2\1K\0\1\0\17integrations\21indent_blankline\1\0\2\fenabled\2\26colored_indent_levels\2\rnvimtree\1\0\2\14show_root\2\fenabled\2\15native_lsp\15underlines\1\0\4\rwarnings\14underline\nhints\14underline\16information\14underline\verrors\14underline\17virtual_text\1\0\4\rwarnings\vitalic\nhints\vitalic\16information\vitalic\verrors\vitalic\1\0\1\fenabled\2\1\0\17\15treesitter\2\rgitsigns\2\16lsp_trouble\1\rlsp_saga\1\14gitgutter\1\14which_key\1\14dashboard\1\vneogit\1\14vim_sneak\1\14telescope\2\15bufferline\2\tfern\1\vbarbar\1\15lightspeed\1\15ts_rainbow\1\bhop\1\rmarkdown\1\vstyles\1\0\5\14functions\vitalic\rkeywords\vitalic\fstrings\tNONE\rcomments\vitalic\14variables\tNONE\1\0\2\16term_colors\1\27transparent_background\1\nsetup\15catppuccin\frequire\27colorscheme catppuccin\bcmd\bvim\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÆ\3\0\0\f\0\20\1.6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\5=\5\n\4B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\3\f\0004\5\3\0\18\6\1\0'\b\r\0'\t\r\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\15\0025\v\16\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\17\0'\t\17\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\18\0025\v\19\0B\t\2\0A\6\1\0?\6\0\0B\3\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rnvim-cmp\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTree*" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n†\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n®\2\0\0\5\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\f\0'\2\n\0B\0\2\1K\0\1\0\19load_extension\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\nfuzzy\2\25override_file_sorter\2\28override_generic_sorter\1\fpickers\1\0\0\30current_buffer_fuzzy_find\1\0\0\1\0\1\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-floaterm"] = {
    commands = { "Floaterm*" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\nW\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008let g:vsnip_snippet_dir = expand('~/.config/vsnip')\bcmd\bvim\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: alpha-nvim
time([[Setup for alpha-nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\15:Alpha<CR>\a++\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "alpha-nvim")
time([[Setup for alpha-nvim]], false)
-- Setup for: bufferline.nvim
time([[Setup for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n©\b\0\0\6\0%\0Y6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\28\0'\4\29\0005\5\30\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\31\0'\4 \0005\5!\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\"\0'\4#\0005\5$\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 9<CR>\14<Leader>9\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 8<CR>\14<Leader>8\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 7<CR>\14<Leader>7\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 6<CR>\14<Leader>6\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 5<CR>\14<Leader>5\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 4<CR>\14<Leader>4\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 3<CR>\14<Leader>3\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 2<CR>\14<Leader>2\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 1<CR>\14<Leader>1\1\0\2\fnoremap\2\vsilent\2 <Cmd>BufferLineMoveNext<CR>\15<Leader>m2\1\0\2\fnoremap\2\vsilent\2 <Cmd>BufferLineMovePrev<CR>\15<Leader>m1\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "bufferline.nvim")
time([[Setup for bufferline.nvim]], false)
time([[packadd for bufferline.nvim]], true)
vim.cmd [[packadd bufferline.nvim]]
time([[packadd for bufferline.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nn\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\24:NvimTreeToggle<CR>\r<Space>e\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\nñ\3\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2$:Telescope lsp_code_actions<CR>\15<Leader>qf\1\0\2\fnoremap\2\vsilent\2-:Telescope current_buffer_fuzzy_find<CR>\n<C-f>\1\0\2\fnoremap\2\vsilent\2\29:Telescope live_grep<CR>\14<Leader>f\1\0\2\fnoremap\2\vsilent\2\30:Telescope find_files<CR>\14<Leader>/\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n†\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n◊\3\0\0\4\0\16\0!6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0009\0\4\0\18\2\0\0009\0\5\0'\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\4\0\18\2\0\0009\0\5\0'\3\a\0B\0\3\0016\0\b\0'\2\t\0B\0\2\0029\0\n\0005\2\v\0005\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\21filetype_exclude\1\6\0\0\thelp\nalpha\vpacker\17neogitstatus\rNvimTree\20buftype_exclude\1\3\0\0\rterminal\14telescope\1\0\6\25show_current_context\2\28show_first_indent_level\1#show_trailing_blankline_indent\1\21show_end_of_line\2\25space_char_blankline\6 \19use_treesitter\2\nsetup\21indent_blankline\frequire\feol:‚Ü¥\14space:‚ãÖ\vappend\14listchars\tlist\18termguicolors\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim
time([[Config for nvim]], true)
try_loadstring("\27LJ\2\n\5\0\0\a\0\21\0\0256\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\1\5\0005\3\6\0005\4\a\0=\4\b\0035\4\t\0005\5\n\0005\6\v\0=\6\f\0055\6\r\0=\6\14\5=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\3B\1\2\1K\0\1\0\17integrations\21indent_blankline\1\0\2\fenabled\2\26colored_indent_levels\2\rnvimtree\1\0\2\14show_root\2\fenabled\2\15native_lsp\15underlines\1\0\4\rwarnings\14underline\nhints\14underline\16information\14underline\verrors\14underline\17virtual_text\1\0\4\rwarnings\vitalic\nhints\vitalic\16information\vitalic\verrors\vitalic\1\0\1\fenabled\2\1\0\17\15treesitter\2\rgitsigns\2\16lsp_trouble\1\rlsp_saga\1\14gitgutter\1\14which_key\1\14dashboard\1\vneogit\1\14vim_sneak\1\14telescope\2\15bufferline\2\tfern\1\vbarbar\1\15lightspeed\1\15ts_rainbow\1\bhop\1\rmarkdown\1\vstyles\1\0\5\14functions\vitalic\rkeywords\vitalic\fstrings\tNONE\rcomments\vitalic\14variables\tNONE\1\0\2\16term_colors\1\27transparent_background\1\nsetup\15catppuccin\frequire\27colorscheme catppuccin\bcmd\bvim\0", "config", "nvim")
time([[Config for nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nÆ\3\0\0\f\0\20\1.6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\5=\5\n\4B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\3\f\0004\5\3\0\18\6\1\0'\b\r\0'\t\r\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\15\0025\v\16\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\17\0'\t\17\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\18\0025\v\19\0B\t\2\0A\6\1\0?\6\0\0B\3\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5ÄÄ¿ô\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2Ä'\4\2\0X\5\1Ä'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \tÔÅ± \t‚úó \nerror\nmatch[\0\1\b\0\a\0\n6\1\0\0009\1\1\1'\3\2\0009\4\3\0009\6\4\0B\4\2\0029\5\5\0009\a\6\0B\5\2\0C\1\2\0\fordinal\nlower\aid\nraise\v%s¬∑%s\vformat\vstring±\1\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\fnumbers\0\26diagnostics_indicator\0\1\0\2\16diagnostics\rnvim_lsp\18close_command\16bdelete! %d\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rnvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17evil_lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008let g:vsnip_snippet_dir = expand('~/.config/vsnip')\bcmd\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Alpha lua require("packer.load")({'alpha-nvim'}, { cmd = "Alpha", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspTrouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "LspTrouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Floaterm* ++once lua require"packer.load"({'vim-floaterm'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined NvimTree* ++once lua require"packer.load"({'nvim-tree.lua'}, {}, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType logos ++once lua require("packer.load")({'formatter.nvim'}, { ft = "logos" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
