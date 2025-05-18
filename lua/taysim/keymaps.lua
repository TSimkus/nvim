vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open explorer' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join with row below' })

-- Jumps with centering
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Search with centering
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>rr', '<cmd>LspRestart<cr>')

vim.keymap.set('x', '<leader>p', [["_dP]], { desc = '[P]aste and keep previous register' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[y]ank selection to system register' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = '[Y]ank entire line to system register' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = '[D]elete to system register' })

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Open lazygit in new tmux window
vim.keymap.set('n', '<leader>lg', '<cmd>silent !tmux neww lazygit<CR>')
vim.keymap.set('n', '<leader>pc', '<cmd>silent !tmux neww sudo update-alternatives --config php<CR>')

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Replace horizontal split to vertical split
vim.keymap.set('n', '<C-w>s', '<cmd>vsplit<CR>')

vim.keymap.set('n', '<leader>ct', '<cmd>tabnew<CR>')

-- Cleans up ^M when pasting from windows...
vim.api.nvim_set_keymap('n', ',m', [[:%s/\r//g<CR>]], { noremap = true, silent = true })

-- Symbol rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap = true, silent = true, desc = 'Rename symbol' })
