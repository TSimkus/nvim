return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig

    config = function()
      vim.keymap.set('n', '<leader>md', ':RenderMarkdown toggle<CR>')
    end,
    opts = {},
  },
}
