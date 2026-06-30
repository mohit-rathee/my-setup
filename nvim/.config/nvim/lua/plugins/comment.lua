return {
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
            enable_autocmd = false,
        },
    },

    {
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },

        config = function()
            require("Comment").setup({
                padding = true,
                sticky = true,
                ignore = nil,

                toggler = {
                    line = "gcc",
                    block = "gbc",
                },

                opleader = {
                    line = "gc",
                    block = "gb",
                },

                extra = {
                    above = "gcO",
                    below = "gco",
                    eol = "gcA",
                },

                mappings = {
                    basic = true,
                    extra = true,
                },

                pre_hook = nil,

                post_hook = nil,
            })
        end,
    },
}
