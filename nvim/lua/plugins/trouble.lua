return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({
            modes = {
                diagnostics = { auto_close = false },
            },
        })
    end,
}
