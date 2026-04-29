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
                    require("conform").format({ bufnr = args.buf, lsp_format = "fallback", quiet = true })
                end,
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        dependencies = { "mason.nvim", },
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                python = { "ruff" },
                go = { "golangci-lint" },
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                c = { "clangtidy" },
            }

            local function available_linters(bufnr)
                local filetype = vim.bo[bufnr].filetype
                local configured = lint.linters_by_ft[filetype] or {}
                local available = {}

                for _, name in ipairs(configured) do
                    local linter = lint.linters[name]
                    local cmd = linter and linter.cmd or nil

                    if type(cmd) == "function" then
                        cmd = cmd()
                    end

                    if type(cmd) == "string" and vim.fn.executable(cmd) == 1 then
                        table.insert(available, name)
                    end
                end

                return available
            end

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function(args)
                    local linters = available_linters(args.buf)
                    if #linters > 0 then
                        lint.try_lint(linters)
                    end
                end,
            })
        end,
    }
}
