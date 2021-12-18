local nvim_lsp = require 'lspconfig'
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

--LSPinstaller
local lsp_installer = require 'nvim-lsp-installer'

lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.capabilities = capabilities
  opts.on_attach = on_attach

  if server.name == 'clangd' then
    opts.cmd = {
      'clangd',
      '-clang-tidy',
      '--clang-tidy-checks=modernize-*,diagnostic-*,analyzer-*,performance-*,readability-*,llvm-*,bugprone-*,-readability-magic-numbers*,-llvm-include-order*,- modernize-use-trailing-return-type*',
      '--background-index=true',
    }

    opts.init_options = {
      fallbackFlags = { '-std=c++20' },
    }
    opts.capabilities = capabilities
    opts.on_attach = on_attach
  elseif server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = { globals = 'vim' },
      },
    }
  end
  server:setup(opts)
end)
--lua format
require('null-ls').config {
  sources = { require('null-ls').builtins.formatting.stylua, require('null-ls').builtins.formatting.prettierd },
}
nvim_lsp['null-ls'].setup {}
--sourcekit server
nvim_lsp.sourcekit.setup {
  cmd = { '/usr/bin/sourcekit-lsp' },
  filetypes = { 'swift' },
  on_attach = on_attach,
  capabilities = capabilities,
}

--Basic Diagnostic settings
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
}

--AutoshowHover
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

--UI Customization
--GutterSigns
local signs = { Error = '✗ ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
