return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'williamboman/mason.nvim',
  },
  config = function()
    local dap = require 'dap'
    local ui = require 'dapui'

    require('dapui').setup()
    require('nvim-dap-virtual-text').setup {}

    dap.adapters.codelldb = {
      type = 'executable',
      -- command = '~/codelldb/extension/adapter/codelldb', -- or if not in $PATH: "/absolute/path/to/codelldb"
      command = 'codelldb', -- or if not in $PATH: "/absolute/path/to/codelldb"

      -- On windows you may have to uncomment this:
      -- detached = false,
    }

    dap.configurations.c = {
      {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = { '~/vscode-php-debug/out/phpDebug.js' },
    }

    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
      },
    }

    vim.keymap.set('n', '<space>b', dap.toggle_breakpoint)
    vim.keymap.set('n', '<space>gb', dap.run_to_cursor)

    vim.keymap.set('n', '<space>?', function()
      require('dapui').eval(nil, { enter = true })
    end)

    vim.keymap.set('n', '<F1>', dap.continue)
    vim.keymap.set('n', '<F2>', dap.step_into)
    vim.keymap.set('n', '<F3>', dap.step_over)
    vim.keymap.set('n', '<F4>', dap.step_out)
    vim.keymap.set('n', '<F5>', dap.step_back)
    vim.keymap.set('n', '<F6>', dap.restart)

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end,
}
