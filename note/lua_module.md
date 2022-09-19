# Lua Module

## Why using module
- Maintainability
- Separation of concerns

## Write a module
1. Prepare project structure
```
lua/mymodule
├── helloworld.lua
└── init.lua
```

2. write the module 
in `lua/mymodule/helloworld.lua`
```lua
local M = {}

function M.sayhello()
  print("Hello module :)")
end

return M
```

3. load the module 
use `require` to load the module.  
now, we can run `:lua require("mymodule/helloword").sayhello()` and shoud see the output directly.  
or we can use the module in an actual script file, eg, in `lua/mymodule/init.lua`
```lua
local hello = require("mymodule/helloworld")

function moduleSayHello()
  hello.sayhello()
end
```

4. test the module
run `:lua require('mymodule').moduleSayHello()`
and you will see "`Hello module :)`"
