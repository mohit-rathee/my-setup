return {
    {
        "nvim-tree/nvim-tree.lua",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
        },

        config = function()
            vim.opt.termguicolors = true

            require("nvim-tree").setup({
                git = {
                    enable = true,
                    ignore = false,
                },

                renderer = {
                    highlight_git = 'all',

                    icons = {
                        show = {
                            git = true,
                        },
                    },
                },

                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },

                sort = {
                    sorter = "case_sensitive",
                },

                view = {
                    width = 30,
                },

                filters = {
                    dotfiles = false,
                    git_ignored = true,
                },
            })
        end,
    },
}
