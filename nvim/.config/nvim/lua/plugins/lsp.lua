return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- LSP installer
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			{
				"mason-org/mason-lspconfig.nvim",
			},

			-- Completion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",

			-- Lua development
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {},
			},
		},

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.diagnostic.config({
				float = {
					border = "rounded",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

					vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

					vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				end,
			})

			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"eslint",
					"ruff",
				},
			})

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
									vim.fn.stdpath("config"),
									"/usr/share/awesome/lib",
								},
							},
							diagnostics = {
								globals = {
									"awesome",
									"client",
									"root",
									"screen",
								},
							},
						},
					},
				},

				ts_ls = {
					on_attach = function(client)
						client.server_capabilities.documentFormattingProvider = true
					end,
				},

				eslint = {
					on_attach = function(client, bufnr)
						client.server_capabilities.documentFormattingProvider = true
					end,
				},

				basedpyright = {
					settings = {
						basedpyright = {
							analysis = {
								typeCheckingMode = "basic",
							},
						},
					},

					on_attach = function(client, bufnr)
						client.server_capabilities.documentFormattingProvider = false

					end,
				},

				ruff = {},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities

				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
