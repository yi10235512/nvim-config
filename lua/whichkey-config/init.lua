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
  { "<leader>a", group = "Claude Code",
    { "<leader>ac", "<CMD>ClaudeCode<CR>", desc = "Toggle Claude" },
    { "<leader>af", "<CMD>ClaudeCodeFocus<CR>", desc = "Focus Claude" },
    { "<leader>ab", "<CMD>ClaudeCodeAdd %<CR>", desc = "Add current buffer" },
    { "<leader>aa", "<CMD>lua require('claudecode-config').diff_accept()<CR>", desc = "Accept diff" },
    { "<leader>ad", "<CMD>lua require('claudecode-config').diff_deny()<CR>", desc = "Deny diff" },
    { "<leader>am", "<CMD>ClaudeCodeSelectModel<CR>", desc = "Select model" },
    { "<leader>al", "<CMD>ClaudeCodeDiffLayout<CR>", desc = "Cycle diff layout" },
    { "<leader>as", "<CMD>ClaudeCodeSend<CR>", desc = "Send selection to Claude", mode = "v" },
  },
  { "<leader>F", "<CMD>lua require('telescope.builtin').live_grep({additional_args = {'--hidden'}})<CR>", desc = "Live Grep" },
  { "<leader>G", group = "Git",
    -- Gitsigns: hunk-level operations inside the buffer
    { "<leader>GD", "<CMD>Gitsigns diffthis<CR>", desc = "Show file diff" },
    { "<leader>GR", "<CMD>Gitsigns reset_hunk<CR>", desc = "Rollback Hunk" },
    { "<leader>Gd", "<CMD>Gitsigns preview_hunk_inline<CR>", desc = "See diff" },
    { "<leader>Gk", "<CMD>Gitsigns nav_hunk prev<CR>", desc = "Prev Hunk" },
    { "<leader>Gj", "<CMD>Gitsigns nav_hunk next<CR>", desc = "Next Hunk" },
    { "<leader>GS", "<CMD>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
    { "<leader>Gs", "<CMD>Gitsigns undo_stage_hunk<CR>", desc = "Unstage Hunk" },
    { "<leader>Ga", "<CMD>Gitsigns stage_buffer<CR>", desc = "Stage whole file" },
    { "<leader>GA", "<CMD>Gitsigns reset_buffer_index<CR>", desc = "Unstage whole file" },
    { "<leader>GT", "<CMD>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Line Blame" },
    { "<leader>GS", "<CMD>'<,'>Gitsigns stage_hunk<CR>", desc = "Stage selected lines", mode = "v" },
    { "<leader>GR", "<CMD>'<,'>Gitsigns reset_hunk<CR>", desc = "Reset selected lines", mode = "v" },
    -- Base: keep Gitsigns and Diffview looking at the same revision
    { "<leader>Gb", "<CMD>GitsignsBaseDefault<CR>", desc = "Base → default branch" },
    { "<leader>GB", "<CMD>GitsignsBaseIndex<CR>", desc = "Base → index" },
    -- Diffview: full-screen diff and history views
    { "<leader>Go", "<CMD>DiffviewOpen<CR>", desc = "Diffview: working tree" },
    { "<leader>Gm", "<CMD>DiffviewOpenDefault<CR>", desc = "Diffview: vs default branch" },
    { "<leader>Gh", "<CMD>DiffviewFileHistory<CR>", desc = "Diffview: history (all files)" },
    { "<leader>Gf", "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview: history (this file)" },
    { "<leader>Gt", "<CMD>DiffviewToggleFiles<CR>", desc = "Diffview: toggle file panel" },
    { "<leader>Gu", "<CMD>DiffviewRefresh<CR>", desc = "Diffview: refresh" },
    { "<leader>Gc", "<CMD>DiffviewClose<CR>", desc = "Diffview: close" },
    { "<leader>Gh", "<CMD>'<,'>DiffviewFileHistory<CR>", desc = "Diffview: history (selection)", mode = "v" },
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
