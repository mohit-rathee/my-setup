return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({
                highlight = {
                    enable = true,
                },

                indent = {
                    enable = true,
                },
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {},
    },
}
