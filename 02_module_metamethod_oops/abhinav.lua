-- a module is a lua file which returns a single table when called
-- a package is a collection of modules
-- abhinav is the module created
_G.abhinav = {}

function abhinav.greet(name)
    return ("Hey " .. name .. ", abhinav says hi!")
end

return abhinav
