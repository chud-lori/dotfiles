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

    -- UI
    { require("plugins.lualine") },
    { require("plugins.alpha-nvim") },
    { require("plugins.which-key") },

    -- Git
    { require("plugins.gitsigns") },
    { require("plugins.git_blame") },

    -- Utility
    { require("plugins.autopairs") },
    { require("plugins.comment") },
    { require("plugins.surround") },


    -- Java Development Tools Language Server
    -- { "mfussenegger/nvim-jdtls" },
}