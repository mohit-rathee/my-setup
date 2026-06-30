local is_linux_console = vim.env.TERM == "linux"

if is_linux_console then
    vim.opt.termguicolors = false
    vim.opt.list = false
    vim.opt.fillchars = {}

    vim.cmd.colorscheme("default")
else
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("rose-pine")
    require("config.transparency").enable()
end
