local awful = require("awful")
local menubar = require("menubar")
local constants = require("constants")
local util = require("util")

-- {{{ Configure the menubar

menubar.utils.terminal = constants.terminal
menubar.cache_entries=true
menubar.show_categories = false
menubar.menu_gen.all_menu_dirs = { "/usr/share/applications/", "/usr/local/share/5applications/"}

-- }}}
local function isempty(s)
    return s == nil or s == ''
end

function run_once(process ,arg_string)
    local ctr = util.get_output("ps cax | grep -c "..process)
    ctr = tonumber(ctr)
    if ctr == 0 then
        local command = ""
        if isempty(arg_string) then
            command = process
        else
            command = process.." "..arg_string
        end
        awful.util.spawn_with_shell(command)
    end
end

local module = { }

function module.autostart()
    menubar.refresh()
    run_once("xscreensaver","-no-splash")
    run_once("nm-applet","--sm-disable")
    run_once("wmname", "LG3D")
    run_once("numlockx"," on")
    run_once("redshift-gtk")
    run_once("volumeicon"," ")
    run_once("cbatticon", "-i notification")
end

function module.menubar()
    menubar.show()
end

return module