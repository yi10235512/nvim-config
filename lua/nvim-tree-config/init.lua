require("nvim-tree").setup {
--  open_on_setup = true,
  hijack_cursor = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "A", action = "create" },
        { key = "D", action = "trash" },
      },
    },
  },
  filters = {
    custom = { "Icon" },
    dotfiles = true, 
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer = {
--  highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "after",
      glyphs = {
        git = {
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      }
    }
  },
}


