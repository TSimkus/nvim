-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>n', ':Neotree reveal<CR>', { desc = '[N]eoTree reveal' } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<leader>n'] = 'close_window',
        },
        desc = '[N]eoTree reveal',
      },
    },
  },
}
