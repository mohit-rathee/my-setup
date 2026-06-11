local awful = require("awful")

awful.keyboard.append_global_keybindings({
    awful.key({}, "XF86MonBrightnessDown", function()
        awesome.emit_signal("acpi::brightness_down")
    end),
})
awful.keyboard.append_global_keybindings({
    awful.key({}, "XF86MonBrightnessUp", function()
        awesome.emit_signal("acpi::brightness_up")
    end),
})
