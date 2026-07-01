return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    keys = {
        {
            "<leader>ff",
            function() require("telescope.builtin").find_files() end,
            desc = "Find Files",
        },
        {
            "<C-p>",
            function() require("telescope.builtin").git_files() end,
            desc = "Git Files",
        },
        {
            "<leader>ht",
            function() require("telescope.builtin").help_tags() end,
            desc = "Help Tags",
        },
    },
}
