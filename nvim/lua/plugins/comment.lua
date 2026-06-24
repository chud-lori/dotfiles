return {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    keys = {
        {
            "<leader>/",
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            mode = "n",
            desc = "Toggle comment",
        },
        {
            "<leader>/",
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            mode = "v",
            desc = "Toggle comment",
        },
    },
    config = function()
        -- import comment plugin safely
        local comment = require("Comment")

        local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

        -- enable comment
        comment.setup({
            -- for commenting tsx and jsx
            pre_hook = ts_context_commentstring.create_pre_hook(),
        })
    end,
}
