local naughty = require("naughty")
local awful = require("awful")

local ICON_PATH = '/usr/share/icons/downloads/brightness.svg'
local ICON_SIZE = nil
local EVENT_TIMEOUT = 3
local VOLUME_EVENT = 'BRIGHTNESS'
local notification_id = nil

local function notify(e_type, e_msg)
    local notification = naughty.notify({
        replaces_id = notification_id,
        icon = ICON_PATH,
        -- title = e_type,
        text = e_msg,
        timeout = EVENT_TIMEOUT,
    })
    notification_id = notification.id
end

local function get_brightness(callback)
    awful.spawn.easy_async_with_shell(
        "brightnessctl -m | cut -d',' -f4",
        function(stdout)
            callback(stdout:gsub("\n",""))
        end
    )
end

awesome.connect_signal("acpi::brightness_up", function()
    awful.spawn("brightnessctl set +5%", false)

    get_brightness(function(level)
        notify(VOLUME_EVENT, "Brightness " .. level)
    end)
end)

awesome.connect_signal("acpi::brightness_down", function()
    awful.spawn("brightnessctl set 5%-", false)

    get_brightness(function(level)
        notify(VOLUME_EVENT, "Brightness " .. level)
    end)
end)
