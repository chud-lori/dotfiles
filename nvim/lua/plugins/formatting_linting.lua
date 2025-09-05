return {
    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim", },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "ruff_format", "black" },
                    go = { "gofumpt" },
                },
            })
            vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                pattern = { "*.py", "*.go" },
                callback = function(args)
                    require("conform").format({ bufnr = args.buf, lsp_format = true })
                end,
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        dependencies = { "mason.nvim", },
        config = function()
            require("lint").linters_by_ft = {
                python = { "ruff" },
                go = { "golangci-lint" },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    }
}
