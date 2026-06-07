return {
    "L3MON4D3/LuaSnip",

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    config = function()
        -- Load vscode-style snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        -- Lua snippets
        ls.add_snippets("lua", {
            s("fun", { t("function "), i(1, "name"), t("("), i(2, "args"), t(")"), t({ "", "\t" }),
                i(3, "body"),
                t({ "", "end" }),
            }),
        })

        -- React / TSX snippets
        ls.add_snippets("typescriptreact", {
            s("useEffect", {
                t("useEffect(() => {"), t({ "", "\t" }),
                i(1, "Effect"),
                t({ "", "}, [" }),
                i(2, "dependencies"),
                t("]);"),
            }),
        })

        -- Snippet navigation
        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, { desc = "LuaSnip Next" })

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { desc = "LuaSnip Prev" })

        vim.keymap.set("s", "<CR>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { desc = "LuaSnip Expand" })
    end,
}
