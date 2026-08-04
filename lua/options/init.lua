vim.opt.shortmess:append('c')
vim.opt.pumheight = 10
vim.opt.fileencoding = 'utf-8'
vim.opt.cmdheight = 1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.conceallevel = 0
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 100
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 10
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.number = true
-- vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.winborder = "rounded"

-- Load the colorscheme
vim.g.nord_borders = true
vim.g.nord_italic = false
require('nord').set()
