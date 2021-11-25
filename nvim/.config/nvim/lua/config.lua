local vim = vim

function _G.getDefault(key)
  --base
  if vim.g.compilecmd ~= nil and vim.g.compilecmd ~= '' and key == 1 then
    return vim.g.compilecmd
  end

  if vim.g.compilecmd2 ~= nil and vim.g.compilecmd2 ~= '' and key == 2 then
    return vim.g.compilecmd2
  end
  local def
  local ext = vim.fn.expand '%'
  local fname = vim.fn.expand '%:r'
  local ftype = vim.bo.filetype
  if ftype == 'cpp' then
    if vim.fn.filereadable(vim.fn.getcwd() .. '/Makefile') == 1 then
      def = 'make -j8 clean && make -j8'
    else
      def = 'g++ -std=c++17 ' .. ext .. ' -o ' .. fname .. ' && ./' .. fname
    end
  elseif ftype == 'python' then
    def = 'python ' .. ext
  else
    return ''
  end
  return def
end

function _G.editCommand(key)
  local default = getDefault(1)
  local default2 = getDefault(2)
  if key == 1 or key == nil then
    local input = vim.fn.input('Primary Command: ', default, 'file')
    if input ~= '' and input ~= nil then
      vim.g.compilecmd = input
    end
  end
  if key == 2 or key == nil then
    local input2 = vim.fn.input('Secondary Command: ', default2, 'file')
    if input2 ~= '' and input2 ~= nil then
      vim.g.compilecmd2 = input2
    end
  end
end

function _G.callCommand()
  if vim.g.compilecmd == nil or vim.g.compilecmd == '' then
    editCommand(1)
  end

  if vim.g.compilecmd ~= '' and vim.g.compilecmd ~= nil then
    vim.api.nvim_command 'write'
    vim.api.nvim_command ":execute 'FloatermNew' expand(compilecmd)"
  end
end

function _G.callSecondaryCommand()
  if vim.g.compilecmd2 == nil or vim.g.compilecmd2 == '' then
    editCommand(2)
  end

  if vim.g.compilecmd2 ~= '' and vim.g.compilecmd2 ~= nil then
    vim.api.nvim_command 'write'
    vim.api.nvim_command ":execute 'FloatermNew' expand(compilecmd2)"
  end
end
vim.api.nvim_command 'map <silent> <buffer> <C-]> :lua callCommand() <CR>'
vim.api.nvim_command 'map <silent> <buffer> <C-\\> :lua callSecondaryCommand() <CR>'
vim.api.nvim_command 'map <silent> <buffer> <leader>\' :lua editCommand() <CR>'

