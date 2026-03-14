function ColorNeovim(color, bool)
  color = color or "catppuccin-macchiato"
  vim.cmd.colorscheme(color)

  -- Set transparency for the active pane
  if (bool) then
    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = 'none' })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = 'none' })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = 'none' })
    vim.api.nvim_set_hl(0, "TabLine", { bg = 'none' })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = 'none' })


    -- Set transparency for the inactive pane
    vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "VertSplitNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "LineNr", { bg = 'none', fg = 'gray' })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = 'none' })
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = 'none' })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = 'none' })

    -- Set transparency for NvimTree
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NvimTreeStatusLine", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NvimTreeStatusLineNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = 'none', fg = 'darkgray' })

    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#24273A" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5B6078" })

    vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none",fg = "#888888" })
    vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = 'none', fg = "#888888" })
  end
end

ColorNeovim("catppuccin-macchiato", true)
