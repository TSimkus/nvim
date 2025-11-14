return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon'):setup()
  end,
  keys = {
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[Add] file to Harpoon',
    },
    {
      '<C-e>',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = '[E]xplore Harpoon Files',
    },

    {
      '<C-H>',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon to file 1',
    },
    {
      '<C-J>',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon to file 2',
    },
    {
      '<C-K>',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Harpoon to file 3',
    },
    {
      '<C-L>',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Harpoon to file 4',
    },
    {
      '<C-S-P>',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'Harpoon to previous',
    },
    {
      '<C-L>',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'Harpoon to next',
    },
  },
}
