return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",

    config = function()
        local npairs = require("nvim-autopairs")

        npairs.setup({
            disable_filetype = { "TelescopePrompt", "vim" },
            enable_check_bracket_line = false,

            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = "$",
                before_key = "h",
                after_key = "l",
                cursor_pos_before = true,
                keys = "qwertyuiopasdfghjklzxcvbnm",
                manual_position = true,
                highlight = "Search",
                highlight_grey = "Comment",
            },
        })

        -- cmp integration
        local cmp_ok, cmp = pcall(require, "cmp")
        if cmp_ok then
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")

            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done()
            )
        end
    end,
}
