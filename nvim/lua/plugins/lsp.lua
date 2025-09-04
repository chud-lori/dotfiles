return {
  -- Mason manages LSP servers and linters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  -- Bridges mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        -- Here you can add LSPs to be automatically installed
        ensure_installed = { "pyright", "gopls" },
      })
    end,
  },

  -- The core LSP configuration plugin
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      -- Local variables for easier access
      local lspconfig = require("lspconfig")
      local on_attach = function(client, bufnr)
        -- A keymap function that can be re-used
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        
        -- Keybindings for LSP features
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
      
      -- Python
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Go
      lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true, -- Use gofumpt for formatting
          },
        },
      })
    end,
  },

  -- For formatting
  {
    "stevearc/conform.nvim",
    dependencies = {
      "mason.nvim",
    },
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

  -- For linting (optional but recommended)
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "mason.nvim",
    },
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
}

