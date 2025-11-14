return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'php',
      'phpdoc',
      'javascript',
      'jsdoc',
      'blade',
      'php_only',
      'regex',
      'json',
      'rust',
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    }
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

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
