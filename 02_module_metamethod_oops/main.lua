local mod = require("abhinav")

io.write("enter your name: ")
local name = io.read()
print(mod.greet(name))

-- OOPS
-- a way of thinking, lua doesn't have objects/not object oriented
-- thus we need to simulate it

local t = {
    name = "abhinav",
    age = 23,
    friends = { "nikhil" }
} -- can act as an object
print(t.age)

-- extensive example
local function Pet(name)
    name = name or Luis
    return {
        name = name,
        status = "hungry",
        feed = function(self)
            print(self.name .. " has been fed")
        end
    }
end

local function Dog(name, breed)
    local dog = Pet(name) -- basically inheritance
    dog.breed = breed
    dog.loyalty = 0
    dog.isLoyal = function(self)
        io.write(self.name .. "'s loyalalty level: ")
        return self.loyalty
    end
    return dog
end

print("dog details -> ")
local d = Dog("lucy", "german shepard")
print(d:isLoyal())
d.loyalty = 100
print(d:isLoyal())
for i, j in pairs(d) do
    print(i .. ": " .. tostring(j))
end


-- meta methods
--[[
__add, __sub, __mul, __div, __pow, __mod, __unm
__len
__eq, __lt, __le
__concat
__call
__index, __newindex
__tostring
]]

local function addAll(a, b)
    return { x = a.x + b.x, y = a.y + b.y }
end

local a1 = { x = 10, y = 20 }
local a2 = { x = 20, y = 30 }

local metatable = {
    __add = addAll
}
setmetatable(a1, metatable)
setmetatable(a2, metatable)
local sum = a1 + a2
print("sum using metatables: " .. sum.x .. "," .. sum.y)
