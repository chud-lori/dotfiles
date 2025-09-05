return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "gopls", "clangd", "ts_ls" },
                handlers = {
                    -- The jdtls setup is handled by mfussenegger/nvim-jdtls directly.
                    -- We prevent mason-lspconfig from trying to set it up here.
                    jdtls = function() end,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "williamboman/mason.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local opts = { noremap = true, silent = true }
                buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
                buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
                buf_set_keymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
                buf_set_keymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)
            end
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = { gopls = { analyses = { unusedparams = true, }, staticcheck = true, gofumpt = true, }, },
            })
            lspconfig.clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end, -- This 'end' closes the main config function for nvim-lspconfig
    }
}

