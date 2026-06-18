-- comment like this
print("Hello, World")      -- double single both quotes work
print("Hi, " .. "Abhinav") -- double dot is the concat operator  can also use , but adds a tab

local a = "10"             -- if just local a, then type and value both are nil
print(type(a))

local desc = [[Hi,
    I am abhinav
Thankyou.]]
print(desc)

-- in lua only nil and false are falsy values  rest all are truthy
-- scope: block scope

C = 10    -- global vars should be in caps, though not error would give warning
_G.C = 30 -- another way to define global variable
local c = 20
print(C, c)

-- has a math lib to perform operations, has other general operators

local str = "my name is abhinav"
print("length of str: " .. #str) --gives length of string

-- escape sequences are also available in lua
-- normal string functions like lower, upper, sub(extract), gsub(replace)
print(string.format("pi: %.2f\nmy age: %i", math.pi, 18))

local age = 12
if age > 18 or age < 11 then
    print("not a teen")
elseif (age ~= 12) then
    print("not a teen")
else
    print("you are a teenager")
end

local old = age > 10 and "kid" or "bigger" -- in lua we can use this thing as ternary operator
print(old)

for i = 10, 5, -1 do
    print(i) -- auto changes lines
end

io.write("what is the value of i: ")
local i = tonumber(io.read())

print("using the while loop: ")
while i < 10 do
    print(i)
    i = i * 2
end

print("using the until/do-while loop: ")
print("though i is " .. i .. " yet would run once")
repeat
    print(i)
    i = i * 2
until i > 10


-- tables in lua-> container for multiple variables
local arr = { 15, 10, 20, "kal", true } -- lua tables are 1-indexed
print("array length: " .. #arr)
-- table.sort(arr) dont do with disimilar data-types
print(arr) -- table memory reference

-- other functions: insert, remove, concate, etc
-- also 2d tables

local function myfun(a, b)
    return a + b -- a, b, a + b both, can return multiple
end
print("the sum of the two no. is: " .. myfun(2, 4))

-- recursive function
local function factorial(n)
    if n == 0 then
        return 1
    end
    return n * factorial(n - 1)
end
io.write("What no. to find the factorial of: ")
print(factorial(tonumber(io.read())))

local function all_sum(...)
    local a = { ... }
    local sum = 0
    for i = 1, #a, 1 do -- you can also loop over pairs, ipairs etc
        sum = sum + a[i]
    end
    return sum
end

print(all_sum(1, 2, 3, 4, 5))


-- Co-routines: functions run till a point stop then start running again from that point
_G.routine_1 = coroutine.create(
    function()
        for i = 1, 10, 1 do
            print("routine_1: " .. i)
            print("status of routine-1: " .. coroutine.status(routine_1))
            if i == 5 then
                coroutine.yield()
            end
        end
    end
)

local function cr2_fun()
    for i = 100, 90, -1 do
        print("routine_2: " .. i)
    end
end
local routine_2 = coroutine.create(cr2_fun)

print(coroutine.resume(routine_1))
print("status of routine-1: " .. coroutine.status(routine_1))
print(coroutine.resume(routine_2))
print(coroutine.resume(routine_1))
print("status of routine-1: " .. coroutine.status(routine_1))
