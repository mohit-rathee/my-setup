local M = {}

local enabled = false

local groups = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "FoldColumn",
    "LineNr",
    "CursorLineNr",
    "EndOfBuffer",
    "StatusLine",
    "StatusLineNC",
    "TabLine",
    "TabLineFill",
    "VertSplit",
    "WinSeparator",

    -- NvimTree
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeEndOfBuffer",
    "NvimTreeVertSplit",
}

local function transparent_bg(group)
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })

    if not ok then
        return
    end

    hl.bg = nil

    vim.api.nvim_set_hl(0, group, hl)
end

function M.enable()
    for _, group in ipairs(groups) do
        transparent_bg(group)
    end

    enabled = true
end

function M.disable()
    vim.cmd.colorscheme(vim.g.colors_name)

    enabled = false
end

function M.toggle()
    if enabled then
        M.disable()
    else
        M.enable()
    end
end

function M.is_enabled()
    return enabled
end

return M
