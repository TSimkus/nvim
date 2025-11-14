function Set_disable_filetypes()
  local os_name = vim.loop.os_uname().sysname
  local os_hostname = vim.loop.os_gethostname()

  local disable_filetypes = {}
  if os_name == 'Windows_NT' or os_hostname == 'LAPTOP-O0LL0JEB' or os_hostname == 'tadas-dev' then -- Disable for work
    disable_filetypes = { php = true, js = true, tpl = true }
  end

  return disable_filetypes
end

return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>F',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = Set_disable_filetypes()
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
    },
  },
}
