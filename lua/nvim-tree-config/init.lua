require("nvim-tree").setup {
  open_on_setup = true,
  hijack_cursor = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "A", action = "create" },
      },
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
}

vim.cmd('nnoremap <C-n> :NvimTreeToggle<CR>')

