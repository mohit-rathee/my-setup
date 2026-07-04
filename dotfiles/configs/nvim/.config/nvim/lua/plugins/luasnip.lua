return {
	"L3MON4D3/LuaSnip",

	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local ls = require("luasnip")

		local s = ls.snippet
		local i = ls.insert_node
		local t = ls.text_node

		local fmt = require("luasnip.extras.fmt").fmt
		local rep = require("luasnip.extras").rep

		-- =========================
		-- Python snippets
		-- =========================

		ls.add_snippets("python", {

			-- Binary search middle
			s(
				"mid",
				fmt(
					[[
mid = (low + high) // 2
]],
					{}
				)
			),


			-- Normal function with array
			s(
				"defa",
				fmt(
					[[
def {}({}):
    print({})

{} = {}

{}({})
]],
					{
						i(1, "function_name"),
						i(2, "arr"),
						rep(2),

						rep(2),
						i(3, "[]"),

						rep(1),
						rep(2),
					}
				)
			),


			-- Function with array + number
			s(
				"defan",
				fmt(
					[[
def {}({}, {}):
    print({}, {})

{} = {}
{} = {}

{}({}, {})
]],
					{
						i(1, "function_name"),
						i(2, "arr"),
						i(3, "num"),

						rep(2),
						rep(3),

						rep(2),
						i(4, "[]"),

						rep(3),
						i(5, "0"),

						rep(1),
						rep(2),
						rep(3),
					}
				)
			),


			-- Striver / Leetcode Solution class
			s(
				"solve",
				fmt(
					[[
class Solution:
    def {}(self, {}):
        {}

sol = Solution()
sol.{}({})
]],
					{
						i(1, "function_name"),
						i(2, "args"),
						i(3, "pass"),
						rep(1),
						i(4, "value"),
					}
				)
			),
		})


		-- =========================
		-- Lua snippets
		-- =========================

		ls.add_snippets("lua", {

			s(
				"fun",
				fmt(
					[[
function {}({})
    {}
end
]],
					{
						i(1, "name"),
						i(2, "args"),
						i(3, "body"),
					}
				)
			),
		})


		-- =========================
		-- React snippets
		-- =========================

		ls.add_snippets("typescriptreact", {

			s(
				"useEffect",
				fmt(
					[[
useEffect(() => {{
    {}
}}, [{}]);
]],
					{
						i(1, "effect"),
						i(2, "dependencies"),
					}
				)
			),
		})


		-- =========================
		-- Navigation
		-- =========================

		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if ls.jumpable(1) then
				ls.jump(1)
			end
		end, { desc = "LuaSnip Next" })


		vim.keymap.set({ "i", "s" }, "<C-h>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { desc = "LuaSnip Prev" })


		vim.keymap.set({ "i", "s" }, "<CR>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { desc = "LuaSnip Expand" })
	end,
}
