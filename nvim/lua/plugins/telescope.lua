return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Search text in project" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find open buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find help tags" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-d>"] = "delete_buffer",
                    },
                },
            },
        })
    end,
}
