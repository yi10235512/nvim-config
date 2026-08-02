require('diffview').setup({
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = "diff3_mixed",
    },
  },
  keymaps = {
    view = {
      { "n", "q", "<CMD>DiffviewClose<CR>", { desc = "Close Diffview" } },
    },
    file_panel = {
      { "n", "q", "<CMD>DiffviewClose<CR>", { desc = "Close Diffview" } },
    },
    file_history_panel = {
      { "n", "q", "<CMD>DiffviewClose<CR>", { desc = "Close Diffview" } },
    },
  },
})

local M = {}

-- Diff the current branch against the merge base with the default branch.
function M.open_default_branch()
  local git = require('mymodule/git')

  if not git.is_work_tree() then
    vim.notify('Diffview: not inside a git work tree', vim.log.levels.WARN)
    return
  end

  local base = git.default_branch()
  if not base then
    vim.notify('Diffview: could not determine the default branch', vim.log.levels.WARN)
    return
  end

  vim.cmd('DiffviewOpen ' .. base .. '...HEAD')
end

vim.api.nvim_create_user_command('DiffviewOpenDefault', function()
  M.open_default_branch()
end, {
  desc = "Diff HEAD against the repo's default branch",
})

return M
