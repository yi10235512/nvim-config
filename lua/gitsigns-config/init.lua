require('gitsigns').setup({
  -- Off by default, which makes gitsigns skip brand-new files entirely: no
  -- attach, no hunks, and `stage_hunk` silently does nothing on them.
  attach_to_untracked = true,
})

local M = {}

-- Point the signs / hunk navigation at the repo's default branch instead of the
-- index, so that in-buffer hunks line up with what `:DiffviewOpenDefault` shows.
-- Applied globally (all buffers) to keep both views on the same base.
function M.base_default_branch()
  local git = require('mymodule/git')

  if not git.is_work_tree() then
    vim.notify('Gitsigns: not inside a git work tree', vim.log.levels.WARN)
    return
  end

  local base = git.default_branch()
  if not base then
    vim.notify('Gitsigns: could not determine the default branch', vim.log.levels.WARN)
    return
  end

  require('gitsigns').change_base(base, true)
  vim.notify('Gitsigns base: ' .. base)
end

function M.base_index()
  require('gitsigns').reset_base(true)
  vim.notify('Gitsigns base: index')
end

vim.api.nvim_create_user_command('GitsignsBaseDefault', function()
  M.base_default_branch()
end, {
  desc = "Set the Gitsigns base to the repo's default branch",
})

vim.api.nvim_create_user_command('GitsignsBaseIndex', function()
  M.base_index()
end, {
  desc = 'Reset the Gitsigns base back to the index',
})

return M
