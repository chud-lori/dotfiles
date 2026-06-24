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

vim.g.nvim_project_mode = vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1

-- Your general Neovim options and keymaps
require("config.options")
require("config.keymaps")

-- The call to setup lazy.nvim with your plugins and a post-setup hook
require("lazy").setup("plugins", {
  dev = {
    -- This ensures the colorscheme is set only after lazy.nvim is done
    setup = function()
      vim.cmd [[colorscheme catppuccin-macchiato]]
    end,
  },
})

local function open_startup_screen()
  if vim.g.nvim_startup_screen_opened then
    return
  end

  vim.g.nvim_startup_screen_opened = true

  if not vim.g.nvim_project_mode or vim.fn.argc() > 1 then
    return
  end

  vim.cmd.cd(vim.fn.fnameescape(vim.fn.argv(0)))

  local current_buf = vim.api.nvim_get_current_buf()
  if vim.bo[current_buf].buftype == "" and vim.bo[current_buf].filetype ~= "alpha" then
    pcall(vim.api.nvim_buf_delete, current_buf, { force = true })
  end

  pcall(function()
    require("persistence").load()
  end)

  local has_file_buffer = false
  for _, buffer in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    if buffer.name ~= "" and vim.bo[buffer.bufnr].buftype == "" then
      has_file_buffer = true
      break
    end
  end

  if not has_file_buffer then
    require("lazy").load({ plugins = { "alpha-nvim" } })
    vim.cmd.Alpha()
  end

  pcall(function()
    require("lazy").load({ plugins = { "nvim-tree.lua" } })
    require("nvim-tree.api").tree.open()
    vim.cmd.wincmd("p")
  end)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  once = true,
  callback = function()
    vim.defer_fn(open_startup_screen, 150)
  end,
})
