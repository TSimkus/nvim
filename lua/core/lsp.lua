-- LSP configs are taken from lspconfig repo:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

vim.lsp.enable {
  'lua_ls',
  'rust_analyzer',
  'intelephense',
  'cssls',
  'htmlls',
  'ts_ls',
}

vim.diagnostic.config {
  -- virtual_lines = true,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
}
