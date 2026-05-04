return {
  -- This plugin manages the installation of LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()

      local registry = require("mason-registry")
      local packages = {
        "black",
        "clang-format",
        "clangd",
        "eslint_d",
        "gofumpt",
        "gopls",
        "prettier",
        "pyright",
        "ruff",
        "rust-analyzer",
        "typescript-language-server",
      }

      local function ensure_installed()
        for _, name in ipairs(packages) do
          local ok, pkg = pcall(registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end

      if registry.refresh then
        registry.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  -- Bridge between mason and nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
  },

  -- LSP configuration using the new vim.lsp.config API (Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Buffer-local keymaps when an LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, noremap = true, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end, opts)
        end,
      })

      -- Default capabilities for every server
      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu", "--completion-style=detailed" },
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            analyses = { unusedparams = true, shadow = true },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
            inlayHints = {
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true },
              parameterHints = { enable = true },
              typeHints = { enable = true },
            },
          },
        },
      })

      vim.lsp.enable({ "pyright", "clangd", "ts_ls", "gopls", "rust_analyzer" })
    end,
  },
}
