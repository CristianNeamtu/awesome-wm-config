local awful = require("awful")
local menubar = require("menubar")
local constants = require("constants")

-- {{{ Configure the menubar

menubar.utils.terminal = constants.terminal
menubar.menu_gen.all_menu_dirs = { "/usr/share/applications/", "/usr/local/share/applications", "~/.local/share/applications" }

-- }}}

function run_once(prg,arg_string,pname,screen)
    if prg then
        if not pname then
            pname = prg
        end

        if not arg_string then
            awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
        else
            awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. " ".. arg_string .."' || (" .. prg .. " " .. arg_string .. ")",screen)
        end
    end
end

local module = { }

function module.autostart()
    menubar.refresh()
    run_once("xscreensaver","-no-splash")
    run_once("nm-applet","--sm-disable")
    run_once("wmname", "LG3D")
    run_once("redshift-gtk")
    run_once("volumeicon")
    run_once("cbatticon", "-i notification")
end

function module.menubar()
    menubar.show()
end

return module