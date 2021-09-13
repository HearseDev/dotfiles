local nvim_lsp = require('lspconfig')
local cmpcapabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--LSPinstall
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require "lspconfig"[server].setup{
      capabilities = cmpcapabilities
    }
  end
end
setup_servers()
-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

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
  buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
--cppserver setup
require "lspconfig".clangd.setup{
    cmd = { "clangd","-clang-tidy", "--clang-tidy-checks=modernize-*,diagnostic-*,analyzer-*,performance-*,readability-*,llvm-*,bugprone-*,-readability-magic-numbers*,-llvm-include-order*,- modernize-use-trailing-return-type*", "--background-index"},
    on_attach = on_attach,
    capabilities = capabilities, cmpcapabilities
  }
--sourcekit server
require "lspconfig".sourcekit.setup{
  cmd = { "/home/ubuntu/.swift/usr/bin/sourcekit-lsp" },
  filetypes = { "swift"},
  on_attach = on_attach,
  capabilities = capabilities, cmpcapabilities
}
--UI Customization
--Basic Diagnostic settings
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  --virtual_text = {
    --spacing = 4,
    --prefix = '~',
  --},
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
})
--AutoshowHover
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
--GutterIcons
local signs = { Error = "✗ ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
--LspSaga
local saga = require 'lspsaga'
saga.init_lsp_saga{
  use_saga_diagnostic_sign = false,
  code_action_prompt = {
    enable = false
  }
}
vim.api.nvim_set_keymap('n', '<leader>qf', '<CMD>lua require(\'lspsaga.codeaction\').code_action()<CR>' , { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>qf', '<CMD>lua require(\'lspsaga.codeaction\').range_code_action()<CR>' , { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>qr', '<CMD>lua require(\'lspsaga.rename\').rename()<CR>', { noremap = true, silent = true })
--lsp_signature
require "lsp_signature".setup{
  floating_window = false,
  hint_prefix = "כֿ "
}
