local wk = require("which-key")
local mappings = {
  q = {":q<CR>", "Quit"},
  w = {":w<CR>", "Save"},
  x = {":bdelete<CR>", "Close"},
  f = {":Telescope find_files<CR>", "Find Files"},
  F = {":Telescope live_grep<CR>", "Live Grep"},
}

local opts = {prefix = "<leader>"}
wk.register(mappings, opts)
