vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

local os_name = vim.loop.os_uname().sysname

if os_name == 'Windows_NT' then
  vim.opt.undodir = os.getenv 'USERPROFILE' .. '\\vim\\undodir'
else
  vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
end

vim.opt.undofile = true

vim.opt.cursorline = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.guicursor = ''
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = 'split'
