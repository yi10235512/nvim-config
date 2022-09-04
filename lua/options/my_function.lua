local session_dir = "~/.config/nvim/.session"

function MySessionSave()
    local fname = vim.fn.input("Session name: ", "", "file")
    vim.api.nvim_command('mksession! ' .. vim.fn.fnameescape(session_dir .. '/' .. fname .. '.vim'))
    vim.v.this_session = fname
    vim.notify('\nSession ' .. fname .. ' is now persistent')
end

function MySessionLoad()
    local sessions = get_sessions()
    vim.notify('Sessions: ')
    for index, value in ipairs(sessions) do
        print("[".. index .. "]", value)
    end
    local selected_index = tonumber(vim.fn.input("Choose a session to load: ", ""))
    vim.api.nvim_command('source ' .. vim.fn.fnameescape(session_dir .. '/' .. sessions[selected_index]))
end

function get_sessions()
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls '.. session_dir)
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    return t
end
