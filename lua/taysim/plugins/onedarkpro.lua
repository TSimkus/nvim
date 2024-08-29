return {
  'olimorris/onedarkpro.nvim',
  name = 'onedark',
  config = function()
    require('onedarkpro').setup {
      options = {
        transparency = false,
        lualine_transparency = false,
      },
    }
  end,

  init = function()
    vim.cmd.colorscheme 'onedark'
    vim.cmd.hi = 'Comment gui=none'
  end,
}
