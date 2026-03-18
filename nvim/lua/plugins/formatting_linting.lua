return {
    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim", },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "ruff_format", "black" },
                    go = { "gofumpt" },
                    rust = { "rustfmt" },
                    c = { "clang_format" },
                    cpp = { "clang_format" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                },
                formatters = {
                    clang_format = {
                        prepend_args = { "--style=file,{BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 100}" },
                    },
                },
            })
            vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                pattern = { "*.py", "*.go", "*.rs", "*.c", "*.cpp", "*.h", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.yaml", "*.yml", "*.md" },
                callback = function(args)
                    require("conform").format({ bufnr = args.buf, lsp_format = "fallback" })
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
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                c = { "clangtidy" },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    }
}
