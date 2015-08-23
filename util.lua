local module = { }

function module.get_output(command)
    local handle = io.popen(command)
    local result = handle:read("*all")
    result = string.gsub(result, "\n", "")
    handle:close()
    return result
end

function joinTables(t1, t2)
    for k,v in ipairs(t2) do table.insert(t1, v) end return t1
end

return module
