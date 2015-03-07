local awful = require("awful")

local module = { }

---------------------------------------------------
--------------------- Audio -----------------------
---------------------------------------------------

function module.increase_volume()
    awful.util.spawn("amixer -c 0 -q set Master 2dB+")
end

function module.decrease_volume()
    awful.util.spawn("amixer -c 0 -q set Master 2dB-")
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
    awful.util.spawn("synclient | grep TouchpadOff | awk '{print $3}'")
end

return module

