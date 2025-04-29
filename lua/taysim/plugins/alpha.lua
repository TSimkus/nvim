local function read_ascii_from_file()
  local ascii_loc = vim.fn.stdpath 'data' .. '/custom_taysim/ascii-art.txt'
  local art = {}

  local file = io.open(ascii_loc, 'r')
  if not file then
    return art
  end

  for line in file:lines() do
    table.insert(art, line)
  end

  file:close()

  return art
end

return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = false,

  config = function()
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = read_ascii_from_file()
    dashboard.section.buttons.val = {}
    dashboard.section.footer.val = { 'Filling in the void' }

    require('alpha').setup(dashboard.config)
  end,
}
