-- Rose Pine theme
vim.cmd.colorscheme("rose-pine")

-- Transparency Enabled
require("config.transparency").enable()

-- Transparency Toggle
vim.keymap.set("n", "<leader>tt", function()
    require("config.transparency").toggle()
end, { desc = "Toggle Transparency" })
