--autopairs
-- If you want insert `(` after select function or method items
require('nvim-autopairs').setup {}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Your configuration here.
    ['<CR>'] = cmp.mapping.confirm { select = true },
     ['<C-e>'] = cmp.mapping.abort(),
    --Super Tab config
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }),
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
