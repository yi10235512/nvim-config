vim.g.mapleader = ' '

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<CR>')
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<CR>')
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<CR>')
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<CR>')

-- Quick escape
vim.keymap.set('i', 'kl', '<ESC>')
vim.keymap.set('v', 'kl', '<ESC>')
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]])

-- Toggle NvimTree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { silent = true })

-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
