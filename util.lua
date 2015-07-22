
local module = { }

function module.get_output(command)
    local handle = io.popen(command)
    local result = handle:read("*all")
    result = string.gsub(result, "\n", "")
    handle:close()
    return result
end

return module