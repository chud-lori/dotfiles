return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto', -- or 'tokyonight' for a consistent look
            },
            -- Configuration to display file location in the status line (commented out)
            -- sections = {
            --     lualine_c = {
            --         {
            --             'filename',
            --             path = 1, -- 1 is for 'short' relative path from project root
            --         }
            --     }
            -- },
            -- Configuration to display full file path in the tabline (commented out)
            -- tabline = {
            --     lualine_a = { 'buffers' },
            --     lualine_b = { 'branch' },
            --     lualine_c = {
            --         {
            --             'filename',
            --             path = 2,  -- 0 = just filename, 1 = relative path, 2 = absolute path
            --         }
            --     },
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = { 'tabs' }
            -- }
        })
    end,
}

