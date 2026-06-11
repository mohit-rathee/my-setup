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
        local rep = require("luasnip.extras").rep

        -- python
        ls.add_snippets("python", {
            s("defa", {
                t("def "), i(1, "function_name"), t("("),
                i(2, "arr"), t({ "):", "    print(" }),
                rep(2),
                t({ ")", "", "" }),
                rep(2), t(" = "), i(3, "[]"),
                t({ "", "" }),
                rep(1), t("("), rep(2), t(")"),
            }),
        })

        ls.add_snippets("python", {
            s("defan", {
                t("def "), i(1, "function_name"), t("("),
                i(2, "arr"), t(", "),
                i(3, "num"),
                t({ "):", "    print(" }),
                rep(2), t(", "), rep(3),
                t({ ")", "", "" }),
                rep(2), t(" = "), i(4, "[]"),
                t({ "", "" }),
                rep(3), t(" = "), i(5, "0"),
                t({ "", "" }),
                rep(1), t("("), rep(2), t(", "), rep(3), t(")"),
            }),
        })


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
        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, { desc = "LuaSnip Next" })

        vim.keymap.set({ "i", "s" }, "<C-h>", function()
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
