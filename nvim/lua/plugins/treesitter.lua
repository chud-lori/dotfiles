return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = { "python", "go", "lua", "javascript", "typescript", "java", "kotlin", "c", "cpp", "rust", "bash", "json", "yaml", "toml", "markdown", "markdown_inline", "dockerfile", "sql" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Keep file open fast; install missing parsers intentionally with :TSInstall.
            auto_install = false,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
