-- Leader key
vim.g.mapleader = " "

local keymap = vim.keymap
local lsp_ui = require("config.lsp_ui")

-- Exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sq", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Disable arrow keys in normal mode
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Buffer navigation
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
-- Show the previous buffer before deleting, so the window and its split stay open.
keymap.set("n", "<leader>bd", function()
  if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
    vim.cmd("bprevious | bdelete #")
  else
    vim.cmd("bdelete")
  end
end, { desc = "Close buffer, keep window" })
keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })
keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })
keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick a buffer to close" })
for i = 1, 9 do
  keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end

-- Word wrap toggle (per window; wrap breaks at word boundaries)
keymap.set("n", "<leader>w", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = true
  vim.wo.breakindent = true
end, { desc = "Toggle word wrap" })

-- Telescope extras
keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Find diagnostics" })
keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Find references" })
keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find symbols" })
keymap.set("n", "pd", lsp_ui.hover, { desc = "Preview documentation" })
