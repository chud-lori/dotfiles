return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
        { "<C-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
        { "<leader>n", "<cmd>NvimTreeFindFile<CR>", desc = "Find current file in NvimTree" },
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
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
    end,
}
