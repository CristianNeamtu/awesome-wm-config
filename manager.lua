local awful = require("awful")

local module = {}

function module.change_focus(value)
    awful.client.focus.byidx(value)
    if client.focus then
        client.focus:raise()
    end
end

function module.previous()
    awful.client.focus.history.previous()
    if client.focus then
        client.focus:raise()
    end
end


return module
