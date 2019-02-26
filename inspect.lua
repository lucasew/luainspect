#! /usr/bin/env lua

function inspector(table, prefix, ret)
    ret = ret or {}
    prefix = prefix or "base"
    for k, v in pairs(table) do
        if type(v) == "table" then
            inspector(table[k], prefix.."."..k, ret)
        else
            ret[prefix.."."..k] = tostring(v)
        end
    end
    return ret
end

if arg[1] then
    local mod = require(arg[1])
    local inspected = inspector(mod)
    for k, v in pairs(inspected) do
        print(k.." = ", tostring(v))
    end
end

module = {
    inspector = inspector
}
return module
