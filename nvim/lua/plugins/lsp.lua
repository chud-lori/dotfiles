local mason_packages = {
  "black",
  "clang-format",
  "clangd",
  "eslint_d",
  "gofumpt",
  "gopls",
  "google-java-format",
  "jdtls",
  "kotlin-language-server",
  "ktlint",
  "prettier",
  "pyright",
  "ruff",
  "rust-analyzer",
  "typescript-language-server",
}

return {
  -- This plugin manages the installation of LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  -- Installs Mason packages without running custom registry install code on startup
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = mason_packages,
        auto_update = false,
        run_on_start = false,
      })
    end,
  },

  -- Bridge between mason and nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- LSP configuration using the new vim.lsp.config API (Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local kotlin_root_markers = {
        "settings.gradle",
        "settings.gradle.kts",
        "build.gradle",
        "build.gradle.kts",
        "pom.xml",
        ".git",
      }

      vim.filetype.add({
        extension = {
          kt = "kotlin",
          kts = "kotlin",
        },
      })

      -- Buffer-local keymaps when an LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local lsp_ui = require("config.lsp_ui")
          local opts = { buffer = args.buf, noremap = true, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", lsp_ui.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", lsp_ui.signature_help, opts)
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

      vim.lsp.config("kotlin_language_server", {
        cmd = { "kotlin-language-server" },
        filetypes = { "kotlin" },
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          on_dir(vim.fs.root(fname, kotlin_root_markers) or vim.fn.getcwd())
        end,
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

      vim.lsp.enable({ "pyright", "clangd", "ts_ls", "gopls", "rust_analyzer", "kotlin_language_server" })
    end,
  },
}
