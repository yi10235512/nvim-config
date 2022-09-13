# Lua
- dynamic, strong, duck typing 

## hello
```lua
print("Hello Lua\n")
```

## comment
```lua
-- one line comment

--[[
  multiple
  line
  comment
]]
```

## io library 
```
name = io.read() 
io.write("Hello ", name, "!\n")
```
## Variables
### nil 
a default variable value when it doesn't get a value assigned
```lua
print(type(notAssignedVar))   -- nil
```

### number
all integer, float in lua is number
float can have precision of 13 digits at most
```lua
number = 5
print(type(5))    -- number
```

### string
```lua
string1 = "This is a string in lua"
string2 = 'single or double quote doesn\'t matter'
string3 = [[
To create a long string that
also keep whitespace,
use two opening bracket!
]]
```
- tostring() => convert to string

- Concatenate
```lua
combindString = string1 .. string2
```

- Length
```lua
s = "This is a string contain 39 characters."
print(string.len(s))     -- 39
print(#s)                -- 39
```

- Replace
```lua
s = "very hungry, very foolish."
print(string.gsub(s, "very", "stay") .. "\n")  -- stay hungry, stay foolish.
```

- Find Index
```lua
s = "hello world"
print(string.find(s, "world") .. "\n")     -- 7
```

- Upper Cast & Lower Cast
```lua
print(string.upper(s))
print(string.lower(s))
```

### boolean
```lua
isHungry = true
print(type(isHungry))    -- boolean
```

## Math
- normal +, -, *, /, %
```lua
num = 4
-- num++        <-- Cannot do this in Lua 
-- num += 1     <-- Caanot do this either 
```

- functions
floor, ceil, max, min, pow, sqrt, random
```lua
print("floor(3.14): ".. math.floor(3.14))      -- floor(3.14): 3
print("ceil(3.14): ".. math.ceil(3.14))        -- ceil(3.14): 4
print("max(5, 6): ".. math.max(5, 6))          -- max(5, 6): 6
print("min(5, 6): ".. math.min(5, 6))          -- min(5, 6): 5
print("pow(3, 2): ".. math.pow(3, 2))          -- pow(3, 2): 9
print("sqrt(16): ".. math.sqrt(16))            -- sqrt(16): 4

print("random(): " .. math.random())           -- random(): 0.79420629243124  (0~1)
print("random(10): " .. math.random(10))       -- random(10): 7               (1~10)
print("random(2, 12): " .. math.random(2, 12)) -- random(2, 12): 8            (2~12)

print(string.format("Pi = %.7f", math.pi))     -- Pi = 3.1415927
```
 
## Relational Operators & Logical Operators
- relational
normal >, <, >=, <=, ==
notice ~= is not operator
- logical
normal and, or, not 
```lua
time = 12
if time < 12 then
  print("morning")
elseif (time >= 12) and (time < 18) then
  print("afternoon")
else
  print("evening")
end
```

no ternary operator
```lua
age = 13
-- canVote = age > 18 ? true : false    <-- Cannot do this 
canVote = age > 18 and true or false
print("Can I vote? " .. tostring(canVote))    -- Can I vote? false
```

## Loop
- do-while loop
has break, no continue
```lua
i = 1
while i <= 5 do
  print(i)
  i = i + 1
  if i == 3 then break end
end
--[[
1 
2 
3  
]]
```

- repeat
```lua
repeat
  io.write("Enter number: ")
  guess = io.read() 
until tonumber(guess) == 5
```

- for loop 
for [init], [end], [step] do XXX end
```lua
for i = 1, 10, 2 do 
  print(i)
end
--[[
1
3
5
7
9
]]
```

- loop a table
```lua
week = {"Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat"}
for key, value in pairs(week) do 
  print(key .. " " .. value)
end
--[[
1 Sun
2 Mon
3 Tue
4 Wed
5 Thr
6 Fri
7 Sat
]]
```

## Tables
- access
```lua
T = {}
for i = 1, 5 do 
  T[i] = i
end

print("Length of table is: " .. #T)   -- Length of table is: 5
```

- insert
table.insert(table, index, value)
```lua
T = {}
print("Init table size is: " .. #T)                     -- Init table size is: 0
T[1] = "Dog"
print("Added a Dog to index 1, now size is: " .. #T)    -- Added a Dog to index 1, now size is: 1
print(T[1] .. " " .. tostring(T[2]))                    -- Dog nil
table.insert(T, 1, "Cat")
print("Inserted a Cat to index 1, now size is: " .. #T) -- Insearted a Cat to index 1, now size is: 2
print(T[1] .. " " .. T[2])                              -- Cat Dog
```

- remove
table.remove(table, index)
```lua
T = {}
T[1] = "Dog"
T[2] = "Cat"
table.remove(T, 1)
print(T[1])         -- Cat
```

- convert a table to string
```lua
T = {}
for i = 1, 5 do 
  T[i] = i
end

print(table.concat(T, ", "))   -- 1, 2, 3, 4, 5
```

- Multidimentional Tables
```lua
aMultiTable = {}
for i = 0, 4 do 
  aMultiTable[i] = {}
  for j = 0, 4 do 
    aMultiTable[i][j] = tostring(i) .. tostring(j)
  end
end

for i = 0, 4 do 
  for j = 0, 4 do 
    io.wirte(aMultiTable[i][j], " ")
  end  
  print()
end
--[[
00 01 02 03 04 
10 11 12 13 14
20 21 22 23 24
30 31 32 33 34 
40 41 42 43 44
]]
```

## Function
```lua
function getSum(num1, nu2)
  return num1 + num2
end
```
```lua
function splitStr(s)
  tableOfWords = {}
  local i = 1
  for word in string.gmatch(s, "[^%s]+") do 
    tableOfWords[i] = word
    i = i + 1
  end
  return tableOfWords, i - 1
end

tableOfWords, numOfStr = splitStr("Learning Lua Function")
for i = 1, numOfStr do 
  print(tableOfWords[i])
end
--[[
Learning
Lua
Function
]]
```

## Variadic functions
meaning: receive an unknow number of parameters
```lua
function getSumMore(...)
  local sum = 0
  for k, v in pairs{...} do
    sum = sum + v
  end
  return sum
end

print(getSumMore(2, 3, 4))  -- 9
```

- function is also a variable that can be store in a variable name
```lua
getSum = function(a, b) return a + b end
print(getSum(2, 3))   -- 5
```

## Closures
define a inner function that can access local variable
inner function is actually going to remember any changes made to the variable inside of the inner function
eg1:
```lua
function outFunc()
  local i = 0
  return function()
    i = i + 1
    return i
  end
end

getI = outFunc()
print(getI())    -- 1
print(getI())    -- 2
```
eg2:
```lua
function makeAdder(num)
  local num = num 
  function (k)
    return num + k
  end
end

addFour = makeAdder(4)
print(addFour(2))    -- 6
```

## Coroutines
like thread in other languages but cannot run parallel
coroutine is going to have a status of running, suspended, dead or normal
running => the coroutine is running (that is, it called status);  
suspended => the coroutine is suspended in a call to yield, or if it has not started running yet;  
normal => the coroutine is active but not running (that is, it has resumed another coroutine);  
dead => the coroutine has finished its body function, or if it has stopped with an error.
eg1:
```lua
co = coroutine.create(function()
  for i = 0, 10, 1 do
    print(i)
    print(coroutine.status(co))
    if i == 5 then coroutine.yield() end
  end
end)

print(coroutine.status(co))    -- suspended
coroutine.resume(co)
--[[
0
running
1
running
2
running
3
running
4
running
5
running
]]
print(coroutine.status(co))    -- suspended
coroutine.resume(co)
--[[
6
running
7
running
8
running
9
running
10
running
]]
print(coroutine.status(co))   -- dead
```
eg2:
```lua
co = coroutine.create(function()
  for i = 1, 5, 1 do
    print(i)
    print(coroutine.status(co))
    if i == 3 then coroutine.yield() end
  end
end)

co2 = coroutine.create(function()
  for i = 20, 25, 1 do
    print(i)
  end
end)

print("co "..coroutine.status(co))       -- co suspended
coroutine.resume(co)
--[[
1
running
2
running
3
running
]]
print("co "..coroutine.status(co))       -- co suspended
print("co2 " .. coroutine.status(co2))   -- co2 suspended
coroutine.resume(co2)
--[[
20
21
22
23
24
25
]]
print("co2 " .. coroutine.status(co2))   -- co2 dead
coroutine.resume(co)
--[[
4
running
5
running
]]
print("co " ..coroutine.status(co))      -- co dead
print("co2 " .. coroutine.status(co2))   -- co2 dead
```

## Module
like library, holding functions and variables 
convert.lua    <-- notice module's file name
```lua
local convert = {}    -- and here init the module
function convert.ftToCm(feet)   -- and here need to write module name before function name
  return feet + 30.48
end
return convert   -- and here need to return the module
```
init.lua
```lua
convertModule = require("convert")  -- require module 
print(string.format("%3f cm", convertModule.ftToCm(12)))  -- 42.480 cm
```

## Metatables
defined how operations on tables should be carried out
```lua
aTable = {}
for i = 1, 10 do 
  aTable[i] = i
end
-- define metatable
mt = {      -- can define __sub, __mul, __div, __mod ...
  __add = function(table1, table2) 
    sumTable = {}
    for i = 1, #table1 do 
      if (table1[i] ~= nil) and (table2[i] ~= nil) then
        sumTable[i] = table1[i] + table2[i]
      else
        sumTable[i] = 0
      end
    end
    return sumTable
  end,

  __eq = function(table1, table2)
    return table1.value == table2.value
  end,

  __lt = function(table1, table2)
    isLess = true
    for i = 1, #table1 do
      if(table1[i] ~= nil) and (table2[i] ~= nil) then
        if(table1[i] >= table2[i]) then
          isLess = false
          break
        end
      end
    end
    return isLess
  end,
  
  __le = function(table1, table2)
    isLessAndEq = true
    for i = 1, #table1 do
      if(table1[i] ~= nil) and (table2[i] ~= nil) then
        if(table1[i] > table2[i]) then
          isLessAndEq = false
          break
        end
      end
    end
    return isLessAndEq
  end,
}
-- attach metatable to table
setmetatable(aTable, mt)
-- eq
print(aTable == aTable)    -- true
-- lt (less then) 
print(aTable < aTable)     -- false 
-- le (less and equal) 
print(aTable <= aTable)    -- true 
-- add
addTable = aTable + aTable
print(table.concat(addTable, ", "))  -- 2, 4, 6, 8, 10, 12, 14, 16, 18, 20 
```

## OOP
Lua is not OOP language, cannot define classes
but can fake it with Tables and Metatables
```lua
Animal = {height = 0, name = "No name", sound = "No sound"}

function Animal:new(height, name, sound)
  setmetatable({}, Animal)
  
  self.height = height
  self.name = name
  self.sound = sound

  return self
end

function Animal:toString()
  animalStr = string.format("%s is %.1f tall, and says %s", self.name, self.height, self.sound)
  return animalStr 
end

dog = Animal:new(20, "Bruce", "bark")
print(dog.name)            -- Bruce
print(dog:toString())      -- Bruce is 20.0 tall, and says bark

-- Inheritance
Cat = Animal:new()

-- Override new()
function Cat:new(height, name, sound, food)
  setmetatable({}, Cat)
  
  self.height = height
  self.name = name
  self.sound = sound
  self.food = food

  return self
end

-- Override toString()
function Cat:toString()
  catStr = string.format("%s is %.1f tall, and says %s, and eat %s", self.name, self.height, self.sound, self.food)
  return catStr 
end

kitty = Cat:new(10, "Kitty", "meow", "fish")
print(kitty:toString())   -- Kitty is 10.0 tall, and says meow, and eat fish 
```
