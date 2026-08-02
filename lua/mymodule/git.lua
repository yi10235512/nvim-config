-- Small git helpers shared by the diffview and gitsigns configs.

local M = {}

local function git(...)
  local out = vim.fn.systemlist({ 'git', ... })
  if vim.v.shell_error ~= 0 then
    return nil
  end
  return out
end

function M.is_work_tree()
  return git('rev-parse', '--is-inside-work-tree') ~= nil
end

-- Prefer `origin`, but fall back to whatever remote the repo actually has.
local function pick_remote()
  local remotes = git('remote') or {}
  for _, r in ipairs(remotes) do
    if r == 'origin' then
      return 'origin'
    end
  end
  return remotes[1]
end

local candidates = { 'main', 'master', 'trunk', 'develop' }

-- Resolve the repo's default branch without touching the network:
-- `<remote>/HEAD` when it has been set locally, otherwise the first branch
-- that exists out of the usual names (remote-tracking first, then local).
function M.default_branch()
  local remote = pick_remote()

  if remote then
    local ref = git('symbolic-ref', '--short', 'refs/remotes/' .. remote .. '/HEAD')
    if ref and ref[1] and ref[1] ~= '' then
      return ref[1]
    end
    for _, name in ipairs(candidates) do
      if git('rev-parse', '--verify', '--quiet', remote .. '/' .. name) then
        return remote .. '/' .. name
      end
    end
  end

  for _, name in ipairs(candidates) do
    if git('rev-parse', '--verify', '--quiet', 'refs/heads/' .. name) then
      return name
    end
  end
end

return M
