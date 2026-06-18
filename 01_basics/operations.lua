-- creating files
io.output("hello.txt")
io.write("hey there, my name is abhinav")
io.close()

local file = io.input("hello.txt")
local a = io.read("a") -- would read as many chars as in the bracket
-- if want to read as number, local a=io.read("*number")
print(a)
io.close(file)

local file = io.open("hello.txt", "a")
file:write(", seems like still having fun!")
file:close()

io.input("hello.txt")
local c = io.read("a")
print(c)


-- os-module
print(os.time({ year = 2002, month = 8, day = 28 }))                                         -- time since 1970, cna pass year for time till then
print((os.difftime(os.time(), os.time({ year = 2002, month = 8, day = 28 }))) / (24 * 3600)) -- return difference in seconds
print(os.clock())                                                                            -- cpu clock time used by lua for the programs
-- other os. functions: rename, getenv, execute(for terminal commands)(bad practice)
