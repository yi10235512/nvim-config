# Lua Module

## Why using module
- Maintainability
- Separation of concerns

## Write a module
1. Prepare project structure
```
lua/modules
├── helloworld.lua
└── init.lua
```

2. write the module 
in `lua/modules/helloworld.lua`
```lua
local M = {}

function M.sayhello()
  print("Hello module :)")
end

return M
```

3. load the module 
use `require` to load the module.  
now, we can run `:lua require("modules/helloword").sayhello()` and shoud see the output directly.  
or we can use the module in an actual script file, eg, in `lua/modules/init.lua`
```lua
local hello = require("modules/helloworld")

function moduleSayHello()
  hello.sayhello()
end
```

4. test the module
run `:lua require('modules').moduleSayHello()`
and you will see "`Hello module :)`"
