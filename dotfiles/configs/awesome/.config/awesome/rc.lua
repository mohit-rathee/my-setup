local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
}

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Startup Error",
        text = awesome.startup_errors,
    })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        if in_error then return end
        in_error = true
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Runtime Error",
            text = tostring(err),
        })
        in_error = false
    end)
end

local mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)

    awful.tag({ "1","2","3","4","5","6","7","8","9" }, s, awful.layout.layouts[1])

    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox(s)

    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
    }

    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
    }

    s.mywibox = awful.wibar({ position = "top", screen = s })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,

        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },

        s.mytasklist,

        {
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
            s.mylayoutbox,
        },
    }
end)

root.buttons(gears.table.join(
    awful.button({}, 3, function() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))

root.keys(gears.table.join(

    awful.key({ modkey }, "Return",
        function() awful.spawn(terminal) end),

    awful.key({ modkey, "Shift" }, "r",
        awesome.restart),

    awful.key({ modkey, "Shift" }, "q",
        awesome.quit),

    awful.key({ modkey }, "j",
        function() awful.client.focus.byidx(1) end),

    awful.key({ modkey }, "k",
        function() awful.client.focus.byidx(-1) end),

    awful.key({ modkey, "Shift" }, "j",
        function() awful.client.swap.byidx(1) end),

    awful.key({ modkey, "Shift" }, "k",
        function() awful.client.swap.byidx(-1) end),

    awful.key({ modkey }, "space",
        function() awful.layout.inc(1) end)
))

client.connect_signal("manage", function(c)
    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)
