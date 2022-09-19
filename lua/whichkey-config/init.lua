local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = { operators = false, }
  },
  window = {
    border = "single", -- none, single, double, shadow
  },
}

local mappings = {
  q = { ":q<CR>", "Quit" },
  w = { ":w<CR>", "Save" },
  x = { ":bdelete<CR>", "Close" },
  f = { ":Telescope find_files<CR>", "Find Files" },
  F = { ":Telescope live_grep<CR>", "Live Grep" },
  b = { ":lua vim.lsp.buf.formatting()<CR>", "Formatting"},
  L = {
    name = "LSP",
    i = { ":LspInfo<CR>", "Connected Language Servers" },
    K = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Document" },
    R = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
    T = { "<CMD>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
    d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Go To Definition" },
    D = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
    r = { "<CMD>lua vim.lsp.buf.references()<CR>", "References" },
    I = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
    F = { "<CMD>lua vim.lsp.buf.formatting()<CR>", "Formatting" }
  },
  G = {
    name = "Git Signs",
    d = { ":Gitsigns preview_hunk<CR>", "See diff" },
    D = { ":Gitsigns diffthis<CR>", "Show file diff" },
    R = { ":Gitsigns reset_hunk<CR>", "Rollback Hunk" },
  },
  ["1"] = {
    name = "Session Management",
    s = { "<CMD>lua saveSession()<CR>", "Save the Session" },
    l = { "<CMD>lua loadSession()<CR>", "Load the Session" }
  },
  ["2"] = {
    name = "Snippet",
    n = { ":VsnipOpen<CR>", "Open vsnip"}
  }
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
