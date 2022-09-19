local hello = require("mymodule/helloworld")
local session_manager = require("mymodule/session-manager")

function moduleSayHello()
  hello.sayhello()
end

function saveSession()
  vim.ui.input({ prompt = "Enter session name: " }, function(fname)
    if fname then
      session_manager.MySessionSave(fname)
      vim.notify('\nSession ' .. fname .. ' is now persistent')
    end
  end)
end

function loadSession()
  local sessions = session_manager.MySessionGetList()
  if #sessions ~= 0 then
    vim.ui.input({ prompt = "Choose a session to load: " }, function(number)
      if number then
        session_manager.MySessionLoad(sessions, number)
      end
    end)
  else
    print("There are no session saved.")
  end
end

function listSession()
  session_manager.MySessionGetList()
end
