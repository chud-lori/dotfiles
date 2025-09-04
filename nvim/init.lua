-- The lazy.nvim bootstrap code block
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Your general Neovim options and keymaps
require("config.options")
require("config.keymaps")

-- The call to setup lazy.nvim with your plugins and a post-setup hook
require("lazy").setup("plugins", {
  dev = {
    -- This ensures the colorscheme is set only after lazy.nvim is done
    setup = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
})

