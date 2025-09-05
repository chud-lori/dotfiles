return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope.builtin")
        local keymap = vim.keymap

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

        keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
        keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Search text in project" })
        keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Find open buffers" })
        keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Find help tags" })
    end,
}
