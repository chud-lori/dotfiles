return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    keys = {
        { "<leader>td", "<cmd>TodoTrouble<CR>", desc = "TODOs (Trouble)" },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next todo",
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Prev todo",
        },
    },
    config = function()
        require("todo-comments").setup()
    end,
}
