return {
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
                dotfiles = false,
                git_ignored = false,
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
}

