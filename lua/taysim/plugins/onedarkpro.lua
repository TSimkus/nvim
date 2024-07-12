return {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- Ensure it loads first

  init = function()
    vim.cmd.colorscheme 'onedark'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
