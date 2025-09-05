return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            integrations = {
                treesitter = true,
                telescope = true,
                gitsigns = true,
                nvimtree = true,
                cmp = true,
                lsp_trouble = true,
            },
        })

        -- Apply the colorscheme
        vim.cmd.colorscheme("catppuccin")
    end,
}

