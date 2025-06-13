return {
  'rmagatti/goto-preview',
  dependencies = { 'rmagatti/logger.nvim' },
  enabled = true,
  event = 'BufEnter',
  config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88

  init = function()
    vim.keymap.set('n', 'gtd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
    vim.keymap.set('n', 'gtt', "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true })
    vim.keymap.set('n', 'gti', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
    vim.keymap.set('n', 'gtD', "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { noremap = true })
    vim.keymap.set('n', 'gtr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })
    vim.keymap.set('n', 'gT', "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
  end,
}
