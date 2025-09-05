-- File: ~/.config/nvim/lua/plugins/init.lua
-- This file defines all plugins to be managed by lazy.nvim

return {
    -- Nvim-tree and its icon dependency
    { require("plugins.nvim-tree") },

    -- LSP, Mason, and other core development tools
    { require("plugins.lsp") },

    -- For formatting and linting
    { require("plugins.formatting_linting") },

    -- Autocompletion and Snippets
    { require("plugins.autocompletion") },

    -- Add Telescope and its dependency
    { require("plugins.telescope") },

    -- Color scheme
    { require("plugins.colorscheme") },

    -- New: Lualine for a beautiful status line
    { require("plugins.lualine") },

    -- New: Gitsigns for Git status in the sign column
    { require("plugins.gitsigns") },

    -- New: Git Blame for inline blame information
    { require("plugins.git_blame") },

    -- Alpha Nvim for dashboard
    { require("plugins.alpha-nvim") },

    -- Java Development Tools Language Server
    { "mfussenegger/nvim-jdtls" },
}


