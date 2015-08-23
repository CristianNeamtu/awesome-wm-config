local awful = require("awful")
local naughty = require("naughty")
local util = require("util")

local module = { }

---------------------------------------------------
--------------------- Audio -----------------------
---------------------------------------------------

function module.increase_volume()
    awful.util.spawn("amixer -c 0 -q set Master 2dB+")
end

function module.decrease_volume()
    awful.util.spawn("amixer -c 0 -q set Master 3dB-")
end

function module.toggle_volume()
    awful.util.spawn("amixer -D pulse set Master toggle")
end

---------------------------------------------------
------------------ Brightness ---------------------
---------------------------------------------------

function module.decrease_brightness()
    awful.util.spawn("xbacklight -dec 10")
end

function module.increase_brightness()
    awful.util.spawn("xbacklight -inc 10")
end

---------------------------------------------------
------------------ Touchpad -----------------------
---------------------------------------------------

function module.toggle_touchpad()
    local result = util.get_output("synclient | grep TouchpadOff | awk '{print !$3}'")
    awful.util.spawn("synclient TouchpadOff="..result)
    naughty.notify(
        {
            text = "Status: "..(result=='0' and 'enabled' or 'disabled'),
            title = "Tochpad",
            position = "top_right",
            timeout = 3
        }
    )
end

return module

