-- Separates WORK and PERSONAL disabled file types for autoformating
function setPatternBasedOnEnvironment()
  local os_name = vim.loop.os_uname().sysname
  local os_hostname = vim.loop.os_gethostname()

  local pattern = {}
  if os_name == 'Windows_NT' or os_hostname == 'LAPTOP-O0LL0JEB' then -- Disable for work
    pattern = {
      ['.*%.blade%.php'] = 'blade',
      ['.*%.tpl'] = 'twig',
    }
  else -- Disable for personal
    pattern = {
      ['.*%.blade%.php'] = 'blade',
    }
  end

  return pattern
end

return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'php', 'phpdoc', 'javascript', 'jsdoc', 'blade', 'php_only' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

    vim.filetype.add {
      pattern = setPatternBasedOnEnvironment(),
    }

    require('nvim-treesitter.configs').setup(opts)

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }

    parser_config.twig = {
      install_info = {
        url = 'https://github.com/gbprod/tree-sitter-twig',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'twig',
    }
  end,
}
