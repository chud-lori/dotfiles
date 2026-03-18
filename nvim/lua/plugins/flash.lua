return {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
        require("flash").setup({
            labels = "asdfghjklqwertyuiopzxcvbnm",
            search = { multi_window = true },
            jump = { nohlsearch = true },
            modes = {
                char = {
                    jump_labels = true,
                    multi_line = false,
                },
            },
        })
    end,
    keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash jump" },
        { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,             desc = "Remote flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Flash treesitter search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle flash search" },
    },
}
