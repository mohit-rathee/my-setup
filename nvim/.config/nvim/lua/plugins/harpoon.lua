return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()
    end,

    keys = {
        {
            "<leader>a",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Harpoon Add File",
        },

        {
            "<C-e>",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Harpoon Menu",
        },

        {
            "<C-h>",
            function()
                require("harpoon"):list():select(1)
            end,
        },

        {
            "<C-t>",
            function()
                require("harpoon"):list():select(2)
            end,
        },

        {
            "<C-n>",
            function()
                require("harpoon"):list():select(3)
            end,
        },

        {
            "<C-s>",
            function()
                require("harpoon"):list():select(4)
            end,
        },

        {
            "<C-S-P>",
            function()
                require("harpoon"):list():prev()
            end,
        },

        {
            "<C-S-N>",
            function()
                require("harpoon"):list():next()
            end,
        },
    },
}
