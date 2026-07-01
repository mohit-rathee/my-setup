return {
    "hrsh7th/nvim-cmp",

    event = "InsertEnter",

    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",

        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },

    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            sources = {
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
            },

            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded",
                }),

                documentation = cmp.config.window.bordered({
                    border = "rounded",
                }),
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item({ select = true }),
                ["<C-k>"] = cmp.mapping.select_prev_item({ select = true }),

                ["<CR>"] = cmp.mapping.confirm({
                    select = true,
                }),

                ["<C-l>"] = cmp.mapping.scroll_docs(4),
                ["<C-h>"] = cmp.mapping.scroll_docs(-4),
            }),

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
        })
    end,
}
