local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },

  mapping = {
    ['<CR>'] = cmp.mapping.confirm { select = true },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '',
        buffer = '',
      })[entry.source.name]
      vim_item.kind = ({
        Text = '',
        Method = '',
        Function = '',
        Constructor = '',
        Field = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = '',
        Event = '',
        Operator = 'ﬦ',
        TypeParameter = '',
      })[vim_item.kind]
      return vim_item
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'vsnip' },
    { name = 'treesitter' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },
}

vim.api.nvim_command([[autocmd FileType logos lua require'cmp'.setup.buffer {
   sources = {
     { name = 'vsnip' },
     { name = 'buffer' },
     { name = 'treesitter' },
     { name = 'path' },
   },
 }]])
