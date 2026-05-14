-- lsp.lua

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

-- Diagnostics floating window styling
local float_opts = {
  border = "rounded",
}

vim.diagnostic.config({
  float = float_opts,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, float_opts
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, float_opts
)

-- Capabilities for nvim-cmp completion
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Neovim Lua dev support
require("neodev").setup({})

-- Keymaps on LSP attach
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})

-- Mason setup
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server)
      lspconfig[server].setup({})
    end,

    -- Lua LSP - restrict to Lua projects only
    lua_ls = function()
      lspconfig.lua_ls.setup {
        filetypes = { "lua" },
        root_dir = lspconfig.util.root_pattern(".luarc.json", ".luarc.jsonc", ".git"),
        settings = {
          Lua = {
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
                ["/usr/share/awesome/lib"] = true,
              },
              checkThirdParty = false,
            },
            diagnostics = {
              globals = { "awesome", "client", "root", "screen" },
            },
          },
        }
      }
    end,

    -- TypeScript LSP - disable formatting to avoid ESLint conflict
    ts_ls = function()
      lspconfig.ts_ls.setup({
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
    end,

    -- ESLint LSP
    eslint = function()
      lspconfig.eslint.setup({
        settings = {
          codeAction = {
            disableRuleComment = {
              enable = true,
              location = "separateLine"
            },
            showDocumentation = {
              enable = true
            }
          },
          codeActionOnSave = {
            enable = true,
            mode = "all"
          },
          format = true,
          quiet = false,
          run = "onType",
          validate = "on",
          workingDirectory = {
            mode = "location"
          }
        },
        on_attach = function(client, bufnr)
          -- Enable formatting from eslint
          client.server_capabilities.documentFormattingProvider = true

          -- Auto-fix on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
    end,
  }
})

-- Pylsp (used for htmldjango)
-- lspconfig.pylsp.setup({
--   filetypes = { "htmldjango" },
--   settings = {
--     pylsp = {
--       plugins = {
--         pylint = { enabled = false },
--         pycodestyle = { enabled = false },
--         pyflakes = {
--           enabled = true,
--           ignore = { 'W' },
--         },
--       },
--     }
--   }
-- })
--
-- -- HTML
-- lspconfig.html.setup {
--   filetypes = { "htmldjango", "html" },
--   settings = {
--     ['html'] = {
--       diagnostics = {
--         enable = true,
--       }
--     }
--   }
-- }
--
-- -- Rust Analyzer
-- lspconfig.rust_analyzer.setup {
--   settings = {
--     ['rust-analyzer'] = {
--       diagnostics = {
--         enable = true,
--       }
--     }
--   }
-- }

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "markdown", "json", "yaml" },
    }),
  },
})
