local npairs = require("nvim-autopairs")

npairs.setup({
  -- Disable in places where it causes pain
  disable_filetype = { "TelescopePrompt", "vim" },

  -- Be predictable, not clever
  enable_check_bracket_line = false,

  -- Fast wrap configuration
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = '$',
    before_key = 'h',
    after_key = 'l',
    cursor_pos_before = true,
    keys = 'qwertyuiopasdfghjklzxcvbnm',
    manual_position = true,
    highlight = 'Search',
    highlight_grey = 'Comment',
  },
})

-- 🔗 Integrate with nvim-cmp (only once, outside setup)
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
