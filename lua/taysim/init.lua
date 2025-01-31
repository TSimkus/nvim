require 'taysim.sets'
require 'taysim.keymaps'
require 'taysim.lazy'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('taysim-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.cmd.hi = 'Comment gui=none'
