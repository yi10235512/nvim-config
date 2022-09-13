vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })

map('t', '<C-h>', '<Cmd>wincmd h<CR>', { noremap = true, silent = false })
map('t', '<C-l>', '<Cmd>wincmd l<CR>', { noremap = true, silent = false })
map('t', '<C-j>', '<Cmd>wincmd j<CR>', { noremap = true, silent = false })
map('t', '<C-k>', '<Cmd>wincmd k<CR>', { noremap = true, silent = false })

map('i', 'kl', '<ESC>', { noremap = true, silent = false })
map('v', 'kl', '<ESC>', { noremap = true, silent = false })
map('t', '<ESC>', [[<C-\><C-n>]], { noremap = true, silent = false })

map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

map('v', '<', '<gv', { noremap = true, silent = false })
map('v', '>', '>gv', { noremap = true, silent = false })
