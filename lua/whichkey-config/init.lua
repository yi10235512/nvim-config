local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = { operators = false, }
  },
  win = {
    border = "single", -- none, single, double, shadow
  },
  icons = {
    mappings = false,
  }
}

wk.add({
  { "<leader>1", group = "Session Management",
    { "<leader>1l", "<CMD>lua loadSession()<CR>", desc = "Load the Session" },
    { "<leader>1s", "<CMD>lua saveSession()<CR>", desc = "Save the Session" },
  },
  { "<leader>2", group = "Snippet",
    { "<leader>2n", "<CMD>VsnipOpen<CR>", desc = "Open vsnip" },
  },
  { "<leader>F", "<CMD>Telescope live_grep<CR>", desc = "Live Grep" },
  { "<leader>G", group = "Git Signs",
    { "<leader>GD", "<CMD>Gitsigns diffthis<CR>", desc = "Show file diff" },
    { "<leader>GR", "<CMD>Gitsigns reset_hunk<CR>", desc = "Rollback Hunk" },
    { "<leader>Gd", "<CMD>Gitsigns preview_hunk<CR>", desc = "See diff" },
  },
  { "<leader>L", group = "LSP",
    { "<leader>LD", "<CMD>lua vim.lsp.buf.declaration()<CR>", desc = "Go To Declaration" },
    { "<leader>LF", "<CMD>lua vim.lsp.buf.format()<CR>", desc = "Formatting" },
    { "<leader>LI", "<CMD>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" },
    { "<leader>LK", "<CMD>lua vim.lsp.buf.hover()<CR>", desc = "Document" },
    { "<leader>LR", "<CMD>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
    { "<leader>LT", "<CMD>lua vim.lsp.buf.type_definition()<CR>", desc = "Type Definition" },
    { "<leader>Ld", "<CMD>lua vim.lsp.buf.definition()<CR>", desc = "Go To Definition" },
    { "<leader>Li", "<CMD>LspInfo<CR>", desc = "Connected Language Servers" },
    { "<leader>Lr", "<CMD>lua vim.lsp.buf.references()<CR>", desc = "References" },
  },
  { "<leader>f", "<CMD>Telescope find_files<CR>", desc = "Find Files" },
  { "<leader>q", "<CMD>q<CR>", desc = "Quit" },
  { "<leader>w", "<CMD>w<CR>", desc = "Save" },
  { "<leader>x", "<CMD>bdelete<CR>", desc = "Close" },
})
