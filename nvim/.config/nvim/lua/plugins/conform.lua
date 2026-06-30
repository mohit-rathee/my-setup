return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format" },
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = false,
            },
        },

        keys = {
            {
                "<F3>",
                function()
                    require("conform").format({
                        async = true,
                        lsp_fallback = false,
                    })
                end,
                desc = "Format buffer",
            },
        },
    },
}
