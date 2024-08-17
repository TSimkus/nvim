return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      disable_background = true,
      styles = {
        italic = false,
      },
    }
  end,

  init = function()
    vim.cmd.colorscheme 'rose-pine-moon'
    vim.cmd.hi = 'Comment gui=none'
  end,
}
