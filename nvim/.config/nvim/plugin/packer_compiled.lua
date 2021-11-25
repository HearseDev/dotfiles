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
local package_path_str = "/Users/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/admin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
    config = { "\27LJ\2\n�\3\0\0\t\0\21\1'6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\5\0009\4\b\1'\6\t\0'\a\n\0B\4\3\2>\4\1\0039\4\b\1'\6\v\0'\a\f\0B\4\3\2>\4\2\0039\4\b\1'\6\r\0'\a\14\0B\4\3\2>\4\3\0039\4\15\1'\6\16\0'\a\17\0'\b\18\0B\4\4\0?\4\0\0=\3\5\0029\2\19\0009\4\20\1B\2\2\1K\0\1\0\topts\nsetup\f:qa<CR>\19  Quit NVIM\6q\vbutton\6c\31~/.config/nvim/lua/lsp.lua\6x#~/.config/nvim/lua/plugins.lua\6z\28~/.config/nvim/init.vim\16file_button\19bottom_buttons\1\2\0\0\vNeovim\bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\t����\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2�'\4\2\0X\5\1�'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \t \t✗ \nerror\nmatch[\0\1\b\0\a\0\n6\1\0\0009\1\1\1'\3\2\0009\4\3\0009\6\4\0B\4\2\0029\5\5\0009\a\6\0B\5\2\0C\1\2\0\fordinal\nlower\aid\nraise\v%s·%s\vformat\vstring�\1\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\fnumbers\0\26diagnostics_indicator\0\1\0\2\16diagnostics\rnvim_lsp\18close_command\16bdelete! %d\nsetup\15bufferline\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["formatter.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\15\0\0296\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0005\3\v\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\21filetype_exclude\1\6\0\0\thelp\nalpha\vpacker\17neogitstatus\rNvimTree\20buftype_exclude\1\3\0\0\rterminal\14telescope\1\0\6\21show_end_of_line\2\25space_char_blankline\6 \19use_treesitter\2\25show_current_context\2#show_trailing_blankline_indent\1\28show_first_indent_level\1\nsetup\21indent_blankline\frequire\feol:↴\14space:⋅\vappend\14listchars\tlist\bopt\bvim\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp-trouble.nvim"] = {
    commands = { "LspTrouble" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17auto_preview\1\14auto_fold\2\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17evil_lualine\frequire\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\ne\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\26:colorscheme material\bcmd\15deep ocean\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\3\0\0\f\0\20\1.6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\5=\5\n\4B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\3\f\0004\5\3\0\18\6\1\0'\b\r\0'\t\r\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\15\0025\v\16\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\17\0'\t\17\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\18\0025\v\19\0B\t\2\0A\6\1\0?\6\0\0B\3\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5����\4\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rnvim-cmp\frequire\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n�\1\0\1\5\3\3\1\19-\1\0\0\18\3\1\0009\1\0\1B\1\2\1-\1\1\0\18\3\1\0009\1\0\1B\1\2\1-\1\2\0\18\3\1\0009\1\0\1B\1\2\1\b\0\0\0X\1\4�6\1\1\0'\3\2\0\18\4\0\0B\1\3\1K\0\1\0\1�\2�\4�\30codelldb exited with code\nprint\nclose\0F\0\0\4\2\2\0\6-\0\0\0005\2\0\0-\3\1\0=\3\1\2B\0\2\1K\0\1\0\0\0\2�\tport\1\0\2\ttype\vserver\thost\014127.0.0.1=\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1�\vappend\rdap.repl\frequire�\1\1\2\6\1\a\0\0246\2\0\0\19\4\0\0\18\5\0\0B\2\3\1\15\0\1\0X\2\16�\18\4\1\0009\2\1\1'\5\2\0B\2\3\2\15\0\2\0X\3\5�6\3\3\0009\3\4\0033\5\5\0B\3\2\1X\3\4�6\3\3\0009\3\4\0033\5\6\0B\3\2\0012\2\0�2\0\0�K\0\1\0\0�\0\0\rschedule\bvim\28Listening on port (%d+)\nmatch\vassert=\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1�\vappend\rdap.repl\frequireL\1\2\6\0\4\0\f6\2\0\0\19\4\0\0\18\5\0\0B\2\3\1\15\0\1\0X\2\4�6\2\1\0009\2\2\0023\4\3\0B\2\2\0012\0\0�K\0\1\0\0\rschedule\bvim\vassert�\2\1\1\14\0\15\0,6\1\0\0009\1\1\0019\1\2\1+\3\1\0B\1\2\0026\2\0\0009\2\1\0029\2\2\2+\4\1\0B\2\2\2'\3\3\0,\4\5\0005\6\5\0005\a\4\0>\1\2\a>\2\3\a=\a\6\0066\a\0\0009\a\1\a9\a\a\a\18\t\3\0\18\n\6\0003\v\b\0B\a\4\3\18\5\b\0\18\4\a\0006\a\t\0\18\t\4\0'\n\n\0006\v\v\0\18\r\5\0B\v\2\2&\n\v\nB\a\3\1\18\t\1\0009\a\f\0013\n\r\0B\a\3\1\18\t\2\0009\a\f\0023\n\14\0B\a\3\0012\0\0�K\0\1\0\0\0\15read_start\rtostring\29Error running codelldb: \vassert\0\nspawn\nstdio\1\0\1\rdetached\2\1\0\0-~/.config/nvim/codelldb/adapter/codelldb\rnew_pipe\tloop\bvimg\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim�\1\1\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\4\0=\2\3\0019\1\5\0004\2\3\0005\3\a\0003\4\b\0=\4\t\3>\3\1\2=\2\6\1K\0\1\0\fprogram\0\1\0\5\16stopOnEntry\2\bcwd\23${workspaceFolder}\ttype\rcodelldb\frequest\vlaunch\tname\16Launch file\bcpp\19configurations\0\rcodelldb\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTree*" },
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\16diagnostics\1\0\0\nicons\1\0\4\thint\b\nerror\b✗\fwarning\b\tinfo\b\1\0\1\venable\2\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n�\2\0\0\5\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\f\0'\2\n\0B\0\2\1K\0\1\0\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\25override_file_sorter\2\14case_mode\15smart_case\nfuzzy\2\fpickers\1\0\0\30current_buffer_fuzzy_find\1\0\0\1\0\1\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-floaterm"] = {
    commands = { "Floaterm*" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/opt/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\nW\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008let g:vsnip_snippet_dir = expand('~/.config/vsnip')\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/admin/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: bufferline.nvim
time([[Setup for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n�\b\0\0\6\0%\0Y6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\28\0'\4\29\0005\5\30\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\31\0'\4 \0005\5!\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\"\0'\4#\0005\5$\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 9<CR>\14<Leader>9\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 8<CR>\14<Leader>8\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 7<CR>\14<Leader>7\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 6<CR>\14<Leader>6\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 5<CR>\14<Leader>5\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 4<CR>\14<Leader>4\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 3<CR>\14<Leader>3\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 2<CR>\14<Leader>2\1\0\2\fnoremap\2\vsilent\2$<Cmd>BufferLineGoToBuffer 1<CR>\14<Leader>1\1\0\2\fnoremap\2\vsilent\2 <Cmd>BufferLineMoveNext<CR>\15<Leader>m2\1\0\2\fnoremap\2\vsilent\2 <Cmd>BufferLineMovePrev<CR>\15<Leader>m1\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "bufferline.nvim")
time([[Setup for bufferline.nvim]], false)
time([[packadd for bufferline.nvim]], true)
vim.cmd [[packadd bufferline.nvim]]
time([[packadd for bufferline.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2$:Telescope lsp_code_actions<CR>\15<Leader>qf\1\0\2\fnoremap\2\vsilent\2-:Telescope current_buffer_fuzzy_find<CR>\n<C-f>\1\0\2\fnoremap\2\vsilent\2\29:Telescope live_grep<CR>\14<Leader>f\1\0\2\fnoremap\2\vsilent\2\30:Telescope find_files<CR>\14<Leader>/\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: alpha-nvim
time([[Setup for alpha-nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\15:Alpha<CR>\a++\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "alpha-nvim")
time([[Setup for alpha-nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nn\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\24:NvimTreeToggle<CR>\r<Space>e\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\3\0\0\f\0\20\1.6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\5=\5\n\4B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\3\f\0004\5\3\0\18\6\1\0'\b\r\0'\t\r\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\15\0025\v\16\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\17\0'\t\17\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\18\0025\v\19\0B\t\2\0A\6\1\0?\6\0\0B\3\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5����\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n�\1\0\1\5\3\3\1\19-\1\0\0\18\3\1\0009\1\0\1B\1\2\1-\1\1\0\18\3\1\0009\1\0\1B\1\2\1-\1\2\0\18\3\1\0009\1\0\1B\1\2\1\b\0\0\0X\1\4�6\1\1\0'\3\2\0\18\4\0\0B\1\3\1K\0\1\0\1�\2�\4�\30codelldb exited with code\nprint\nclose\0F\0\0\4\2\2\0\6-\0\0\0005\2\0\0-\3\1\0=\3\1\2B\0\2\1K\0\1\0\0\0\2�\tport\1\0\2\ttype\vserver\thost\014127.0.0.1=\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1�\vappend\rdap.repl\frequire�\1\1\2\6\1\a\0\0246\2\0\0\19\4\0\0\18\5\0\0B\2\3\1\15\0\1\0X\2\16�\18\4\1\0009\2\1\1'\5\2\0B\2\3\2\15\0\2\0X\3\5�6\3\3\0009\3\4\0033\5\5\0B\3\2\1X\3\4�6\3\3\0009\3\4\0033\5\6\0B\3\2\0012\2\0�2\0\0�K\0\1\0\0�\0\0\rschedule\bvim\28Listening on port (%d+)\nmatch\vassert=\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1�\vappend\rdap.repl\frequireL\1\2\6\0\4\0\f6\2\0\0\19\4\0\0\18\5\0\0B\2\3\1\15\0\1\0X\2\4�6\2\1\0009\2\2\0023\4\3\0B\2\2\0012\0\0�K\0\1\0\0\rschedule\bvim\vassert�\2\1\1\14\0\15\0,6\1\0\0009\1\1\0019\1\2\1+\3\1\0B\1\2\0026\2\0\0009\2\1\0029\2\2\2+\4\1\0B\2\2\2'\3\3\0,\4\5\0005\6\5\0005\a\4\0>\1\2\a>\2\3\a=\a\6\0066\a\0\0009\a\1\a9\a\a\a\18\t\3\0\18\n\6\0003\v\b\0B\a\4\3\18\5\b\0\18\4\a\0006\a\t\0\18\t\4\0'\n\n\0006\v\v\0\18\r\5\0B\v\2\2&\n\v\nB\a\3\1\18\t\1\0009\a\f\0013\n\r\0B\a\3\1\18\t\2\0009\a\f\0023\n\14\0B\a\3\0012\0\0�K\0\1\0\0\0\15read_start\rtostring\29Error running codelldb: \vassert\0\nspawn\nstdio\1\0\1\rdetached\2\1\0\0-~/.config/nvim/codelldb/adapter/codelldb\rnew_pipe\tloop\bvimg\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim�\1\1\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\4\0=\2\3\0019\1\5\0004\2\3\0005\3\a\0003\4\b\0=\4\t\3>\3\1\2=\2\6\1K\0\1\0\fprogram\0\1\0\5\16stopOnEntry\2\bcwd\23${workspaceFolder}\ttype\rcodelldb\frequest\vlaunch\tname\16Launch file\bcpp\19configurations\0\rcodelldb\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17evil_lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2�'\4\2\0X\5\1�'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \t \t✗ \nerror\nmatch[\0\1\b\0\a\0\n6\1\0\0009\1\1\1'\3\2\0009\4\3\0009\6\4\0B\4\2\0029\5\5\0009\a\6\0B\5\2\0C\1\2\0\fordinal\nlower\aid\nraise\v%s·%s\vformat\vstring�\1\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\fnumbers\0\26diagnostics_indicator\0\1\0\2\16diagnostics\rnvim_lsp\18close_command\16bdelete! %d\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rnvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\ne\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\26:colorscheme material\bcmd\15deep ocean\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008let g:vsnip_snippet_dir = expand('~/.config/vsnip')\bcmd\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\15\0\0296\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0005\3\v\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\21filetype_exclude\1\6\0\0\thelp\nalpha\vpacker\17neogitstatus\rNvimTree\20buftype_exclude\1\3\0\0\rterminal\14telescope\1\0\6\21show_end_of_line\2\25space_char_blankline\6 \19use_treesitter\2\25show_current_context\2#show_trailing_blankline_indent\1\28show_first_indent_level\1\nsetup\21indent_blankline\frequire\feol:↴\14space:⋅\vappend\14listchars\tlist\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[au CmdUndefined Floaterm* ++once lua require"packer.load"({'vim-floaterm'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined NvimTree* ++once lua require"packer.load"({'nvim-tree.lua'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspTrouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "LspTrouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Alpha lua require("packer.load")({'alpha-nvim'}, { cmd = "Alpha", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType logos ++once lua require("packer.load")({'formatter.nvim'}, { ft = "logos" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
