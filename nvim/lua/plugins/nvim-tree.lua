return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
        {
            "<C-b>",
            function()
                local has_file_buffer = false
                for _, buffer in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
                    if buffer.name ~= "" and vim.bo[buffer.bufnr].buftype == "" then
                        has_file_buffer = true
                        break
                    end
                end

                if not vim.g.nvim_project_mode and not has_file_buffer then
                    vim.notify("Open a project with `nvim .` before opening NvimTree", vim.log.levels.INFO)
                    return
                end

                vim.cmd.NvimTreeToggle()
            end,
            desc = "Toggle NvimTree",
        },
        {
            "<leader>n",
            function()
                if not vim.g.nvim_project_mode and vim.api.nvim_buf_get_name(0) == "" then
                    vim.notify("Open a project with `nvim .` before using NvimTree", vim.log.levels.INFO)
                    return
                end

                vim.cmd.NvimTreeFindFile()
            end,
            desc = "Find current file in NvimTree",
        },
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
