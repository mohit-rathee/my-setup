return {
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		init = function()
			-- Note: Neovim 0.10+ native comment mapping shortcuts:
			-- 'gcc' to toggle line comment
			-- 'gbc' to toggle block comment
			-- 'gc' / 'gb' for visual mode selections
		end,
	},
}
