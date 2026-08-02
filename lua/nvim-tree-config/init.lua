local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'u',   api.node.navigate.parent, opts('Go to Parent Folder'))
  vim.keymap.set('n', 'A',   api.fs.create,            opts('Create file/folder'))
  vim.keymap.set('n', 'D',   api.fs.trash,             opts('Trash'))
  vim.keymap.set('n', '?',   api.tree.toggle_help,     opts('Help'))
  vim.keymap.set('n', '1g',  api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  vim.keymap.set('n', '1c',  api.tree.collapse_all,    opts('Collapse All'))
end

require("nvim-tree").setup {
  --  open_on_setup = true,
  on_attach = my_on_attach,
  hijack_cursor = true,
  view = {
    adaptive_size = true,
  },
  filters = {
    dotfiles = true,
    custom = { "^Icon$", "^.git$" },
    exclude = { ".clangd", ".gitignore", "/bin", "/build" }
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
