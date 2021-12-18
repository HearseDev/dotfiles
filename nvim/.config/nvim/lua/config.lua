local ctable = {}

local getPath = function(str)
  local sep = '/'
  local path = str:match('(.*' .. sep .. ')')
  if str == os.getenv 'HOME' .. '/' or str .. '/' == os.getenv 'HOME' .. '/' then
    return str
  elseif path == os.getenv 'HOME' .. '/' or path .. '/' == os.getenv 'HOME' .. '/' then
    return str
  end
  return path
end

function _G.getDefault(key)
  --If the command in the ctable is already set, then return that value
  if ctable[key] ~= nil and ctable[key] ~= '' then
    return ctable[key]
  end
  --Default Values
  local default
  local ext = vim.fn.expand '%'
  local fname = vim.fn.expand '%:r'
  local ftype = vim.bo.filetype

  if ftype == 'cpp' or ftype == 'c' then
    if vim.fn.filereadable(vim.fn.getcwd() .. '/Makefile') == 1 then
      default = '(make -j8 clean; make -j8)'
    elseif vim.fn.filereadable(getPath(vim.fn.getcwd()) .. '/Makefile') == 1 then
      default = '(cd ..;make -j8 clean; make -j8)'
    elseif ftype == 'cpp' then
      default = '(g++ -std=c++17 ' .. ext .. ' -o ' .. fname .. '; ./' .. fname .. ')'
    elseif ftype == 'c' then
      default = '(gcc ' .. ext .. ' -o ' .. fname .. '; ./' .. fname .. ')'
    end
  elseif ftype == 'make' then
    default = '(make clean; make)'
  elseif ftype == 'python' then
    default = '(python ' .. ext .. ')'
  else
    return ''
  end
  return default
end

function _G.editCommand(key)
  local default = getDefault(key)
  local input = vim.fn.input('Key #' .. key + 1 .. ' ', default, 'file')
  if input ~= nil and input ~= '' then
    ctable[key] = input
    --[[ else
    print 'The input is not enough' ]]
  end
end

function _G.callCommand(key)
  if ctable[key] ~= nil and ctable[key] ~= '' then
    vim.api.nvim_command 'write' -- change this in the future, if file is unchanged then do not write
    vim.api.nvim_command('FloatermNew ' .. ctable[key])
  else
    editCommand(key)
  end
end

vim.api.nvim_set_keymap('n', '<Leader>]1', [[:lua callCommand(0)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>]2', [[:lua callCommand(1)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>]3', [[:lua callCommand(2)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>]4', [[:lua callCommand(3)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>]5', [[:lua callCommand(4)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<Leader>'1", [[:lua editCommand(0)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<Leader>'2", [[:lua editCommand(1)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<Leader>'3", [[:lua editCommand(2)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<Leader>'4", [[:lua editCommand(3)<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<Leader>'5", [[:lua editCommand(4)<CR>]], { noremap = true, silent = false })

require('formatter').setup {
  filetype = {
    logos = {
      -- clang-format
      function()
        return {
          exe = "python3" ,
          args = {os.getenv 'HOME' .. '/logos-format/logos-format.py',"--assume-filename", "objc"},
          stdin = true,
          cwd = vim.fn.expand '%:p:h',  -- Run clang-format in cwd of the file.
        }
      end,
    },
  },
}
