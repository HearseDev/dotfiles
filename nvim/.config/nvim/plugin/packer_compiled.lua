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
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2�'\4\2\0X\5\1�'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \t \t✗ \nerror\nmatch[\0\1\b\0\a\0\n6\1\0\0009\1\1\1'\3\2\0009\4\3\0009\6\4\0B\4\2\0029\5\5\0009\a\6\0B\5\2\0C\1\2\0\fordinal\nlower\aid\nraise\v%s·%s\vformat\vstring�\1\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\fnumbers\0\26diagnostics_indicator\0\1\0\2\18close_command\16bdelete! %d\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  ["cmp-treesitter"] = {
    after_files = { "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-treesitter"
  },
  ["cmp-vsnip"] = {
    after_files = { "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/cmp-vsnip"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21context_patterns\1\b\0\0\nwhile\aif\bfor\vmethod\rfunction\nclass\vstruct\21filetype_exclude\1\6\0\0\thelp\nalpha\vpacker\17neogitstatus\rNvimTree\20buftype_exclude\1\3\0\0\rterminal\14telescope\1\0\6\25show_current_context\2\19use_treesitter\2\25space_char_blankline\5\21show_end_of_line\1#show_trailing_blankline_indent\1\17indent_level\3\4\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["indent-o-matic"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/indent-o-matic"
  },
  kommentary = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-trouble.nvim"] = {
    commands = { "LspTrouble" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14auto_fold\2\17auto_preview\1\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17evil_lualine\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rnvim-cmp\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTree*" },
    config = { "\27LJ\2\n�\1\0\0\3\0\a\0\v6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0005\2\4\0=\2\6\1=\1\3\0K\0\1\0\blsp\1\0\0\1\0\4\tinfo\b\fwarning\b\thint\b\nerror\b✗\20nvim_tree_icons\30nvim_tree_lsp_diagnostics\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n�\2\0\0\5\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\f\0'\2\n\0B\0\2\1K\0\1\0\19load_extension\15extensions\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\1\fpickers\1\0\0\30current_buffer_fuzzy_find\1\0\0\1\0\1\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\nd\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\28:colorscheme tokyonight\bcmd\nstorm\21tokyonight_style\6g\bvim\0" },
    loaded = true,
    path = "/home/admin/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-floaterm"] = {
    commands = { "Floaterm*" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/vim-floaterm"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/admin/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2$:Telescope lsp_code_actions<CR>\15<Leader>qf\1\0\2\vsilent\2\fnoremap\2-:Telescope current_buffer_fuzzy_find<CR>\n<C-f>\1\0\2\vsilent\2\fnoremap\2\29:Telescope live_grep<CR>\14<Leader>f\1\0\2\vsilent\2\fnoremap\2\30:Telescope find_files<CR>\14<Leader>/\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: alpha-nvim
time([[Setup for alpha-nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\15:Alpha<CR>\a++\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "alpha-nvim")
time([[Setup for alpha-nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nn\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\24:NvimTreeToggle<CR>\r<Space>e\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rnvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\28:colorscheme tokyonight\bcmd\nstorm\21tokyonight_style\6g\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21context_patterns\1\b\0\0\nwhile\aif\bfor\vmethod\rfunction\nclass\vstruct\21filetype_exclude\1\6\0\0\thelp\nalpha\vpacker\17neogitstatus\rNvimTree\20buftype_exclude\1\3\0\0\rterminal\14telescope\1\0\6\25show_current_context\2\19use_treesitter\2\25space_char_blankline\5\21show_end_of_line\1#show_trailing_blankline_indent\1\17indent_level\3\4\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2�'\4\2\0X\5\1�'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \t \t✗ \nerror\nmatch[\0\1\b\0\a\0\n6\1\0\0009\1\1\1'\3\2\0009\4\3\0009\6\4\0B\4\2\0029\5\5\0009\a\6\0B\5\2\0C\1\2\0\fordinal\nlower\aid\nraise\v%s·%s\vformat\vstring�\1\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\fnumbers\0\26diagnostics_indicator\0\1\0\2\18close_command\16bdelete! %d\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17evil_lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspTrouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "LspTrouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined NvimTree* ++once lua require"packer.load"({'nvim-tree.lua'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Floaterm* ++once lua require"packer.load"({'vim-floaterm'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Alpha lua require("packer.load")({'alpha-nvim'}, { cmd = "Alpha", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'cmp-treesitter', 'cmp-vsnip', 'vim-vsnip', 'cmp-buffer', 'null-ls.nvim', 'cmp-nvim-lsp', 'nvim-lspconfig', 'cmp-nvim-lua', 'nvim-lspinstall', 'cmp-path'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'cmp-treesitter', 'cmp-vsnip', 'vim-vsnip', 'cmp-buffer', 'cmp-nvim-lsp', 'nvim-lspconfig', 'cmp-nvim-lua', 'nvim-lspinstall', 'cmp-path'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'cmp-treesitter', 'cmp-vsnip', 'vim-vsnip', 'cmp-buffer', 'cmp-nvim-lsp', 'nvim-lspconfig', 'cmp-nvim-lua', 'nvim-lspinstall', 'cmp-path'}, { ft = "c" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
