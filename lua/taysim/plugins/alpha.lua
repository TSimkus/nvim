return {
  'goolord/alpha-nvim',
  -- dependencies = { 'echasnovski/mini.icons' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local dashboard = require 'alpha.themes.dashboard'
    local os_name = vim.loop.os_uname().sysname
    local os_hostname = vim.loop.os_gethostname()

    if os_name == 'Windows_NT' or os_hostname == 'LAPTOP-O0LL0JEB' then -- Work
      dashboard.section.header.val = {
        [[  ______   _    _   _____    _   _   _____   _______   _    _   _____    ______   __ ]],
        [[ |  ____| | |  | | |  __ \  | \ | | |_   _| |__   __| | |  | | |  __ \  |  ____| /_ |]],
        [[ | |__    | |  | | | |__) | |  \| |   | |      | |    | |  | | | |__) | | |__     | |]],
        [[ |  __|   | |  | | |  _  /  | . ` |   | |      | |    | |  | | |  _  /  |  __|    | |]],
        [[ | |      | |__| | | | \ \  | |\  |  _| |_     | |    | |__| | | | \ \  | |____   | |]],
        [[ |_|       \____/  |_|  \_\ |_| \_| |_____|    |_|     \____/  |_|  \_\ |______|  |_|]],
      }

      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('SPACE pp', '  > Project picker', ':Telescope project<CR>'),
        dashboard.button('SPACE pr', '  > Recent', ':Telescope oldfiles<CR>'),
        dashboard.button('q', '  > Quit', ':qa<CR>'),
      }
    else -- Personal
      dashboard.section.header.val = {
        [[  _                           _             ]],
        [[ | |                         (_)            ]],
        [[ | |_    __ _   _   _   ___   _   _ __ ___  ]],
        [[ | __|  / _` | | | | | / __| | | | '_ ` _ \ ]],
        [[ | |_  | (_| | | |_| | \__ \ | | | | | | | |]],
        [[  \__|  \__,_|  \__, | |___/ |_| |_| |_| |_|]],
        [[                 __/ |                      ]],
        [[                |___/                       ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('SPACE pp', '  > Project picker', ':Telescope project<CR>'),
        dashboard.button('SPACE pr', '  > Recent', ':Telescope oldfiles<CR>'),
        dashboard.button('q', '  > Quit', ':qa<CR>'),
      }
    end

    require('alpha').setup(dashboard.config)
  end,
}
