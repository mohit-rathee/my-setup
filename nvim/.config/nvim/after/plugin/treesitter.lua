require 'nvim-treesitter.config'.setup {
  ensure_installed = { "c", "javascript", "python", "rust", "lua", "vim", "vimdoc", "query", "go" },
  sync_install = false,
  auto_install = true,
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
}

require("treesitter-context").setup({
  enable = true, -- Enable this plugin
  max_lines = 0, -- How many lines to show at most
})

-- set this variable to true
_G.ts_context_enabled = true

function _G.toggle_ts_context()
  _G.ts_context_enabled = not _G.ts_context_enabled
  require("treesitter-context").setup({
    enable = _G.ts_context_enabled,
  })
  vim.notify("Treesitter Context " .. (_G.ts_context_enabled and "Enabled" or "Disabled"))
end

vim.keymap.set("n", "<leader>tc", toggle_ts_context, { desc = "Toggle Treesitter Context" })
