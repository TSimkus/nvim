local os_name = vim.loop.os_uname().sysname
local os_hostname = vim.loop.os_gethostname()

local file_ignore_patterns = {
  'node%_modules/.*',
  'vendor/*',
}

if os_name == 'Windows_NT' or os_hostname == 'LAPTOP-O0LL0JEB' then -- Disable for work
  table.insert(file_ignore_patterns, '**/vendor/*')
  table.insert(file_ignore_patterns, 'var/cache/*')
  table.insert(file_ignore_patterns, 'public_html/templates/assets/*')
else -- Disable for personal
end

return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      defaults = {
        file_ignore_patterns = file_ignore_patterns,
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = '[P]eview [H]elp list' })
    vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = '[P]eview [K]eymaps list' })
    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]eview [F]iles list' })
    vim.keymap.set(
      'n',
      '<leader>pF',
      '<cmd>:Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>',
      { desc = '[P]eview [F]iles list (with hidden)' }
    )
    vim.keymap.set('n', '<leader>ps', builtin.builtin, { desc = '[P]eview [S]elect Telescope list' })
    vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = '[P]eview current [W]ord list' })
    vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = '[P]eview by [G]rep list' })
    vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = '[P]eview [D]iagnostics list' })
    vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = '[P]eview [R]esume list' })
    vim.keymap.set('n', '<leader>p.', builtin.oldfiles, { desc = '[P]eview Recent Files list ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
