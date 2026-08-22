local session_dir = vim.fn.stdpath "config" .. "/.sessions"

if vim.fn.isdirectory(session_dir) == 0 then
  vim.fn.mkdir(session_dir, "p")
end

local M = {}

function M.MySessionSave(fname)
  vim.api.nvim_command('mksession! ' .. vim.fn.fnameescape(session_dir .. '/' .. fname .. '.vim'))
  vim.v.this_session = fname
end


function M.MySessionLoad(sessions, selected_index)
  vim.api.nvim_command('source ' .. vim.fn.fnameescape(session_dir .. '/' .. sessions[tonumber(selected_index)]))
end

function M.MySessionGetList()
  local sessions = get_sessions()
  vim.notify('Sessions: ')
  for index, value in ipairs(sessions) do
    print("[" .. index .. "]", value)
  end
  return sessions
end

function get_sessions()
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls ' .. session_dir)
  for filename in pfile:lines() do
    i = i + 1
    t[i] = filename
  end
  return t
end

return M
