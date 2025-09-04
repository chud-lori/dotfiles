-- File: ~/.config/nvim/lua/plugins/init.lua
-- This file defines all plugins to be managed by lazy.nvim

return {
    -- Nvim-tree and its icon dependency
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require("nvim-tree").setup({
                view = {
                    width = 30,
                },
                filters = {
                    dotfiles = true,
                },
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },
                renderer = {
                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                        glyphs = {
                            default = "",
                            folder = {
                                arrow_open = "",
                                arrow_closed = "",
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "",
                                staged = "✓",
                                untracked = "",
                            },
                        },
                    },
                },
            })
            vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
            vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', { desc = 'Find current file in NvimTree' })
        end,
    },

    -- LSP, Mason, and other core development tools
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
                ensure_installed = { "pyright", "gopls" },
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
        end,
    },

    -- Formatting and Linting
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
    },

    -- Autocompletion and Snippets
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" }, }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").jump(args.body)
                    end,
                },
            })
        end,
    },

      -- Add Telescope and its dependency
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope.builtin")
      local keymap = vim.keymap

      -- Find files like Cmd+P in VS Code
      keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })

      -- Search text in your project
      keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Search text in project" })

      -- Other useful Telescope keymaps
      keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Find open buffers" })
      keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Find help tags" })
    end,
  },

    
    -- Color scheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
      -- New: Lualine for a beautiful status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto', -- or 'tokyonight' for a consistent look
        }
      })
    end,
  },

  -- New: Gitsigns for Git status in the sign column
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end,
  },

  
  -- New: Git Blame for inline blame information
  { "f-person/git-blame.nvim" }

}

