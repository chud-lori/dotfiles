-- General Neovim options
local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Search behavior
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- Clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Netrw
vim.cmd("let g:netrw_liststyle = 3")

-- Indentation
opt.tabstop = 4         -- A tab is 4 spaces
opt.shiftwidth = 4      -- Indents are 4 spaces
opt.expandtab = true    -- Use spaces instead of tabs

-- User Interface
opt.termguicolors = true   -- Enable true color support
opt.cursorline = true      -- Highlight the current line
opt.signcolumn = "yes"     -- Always show the sign column for diagnostics
opt.colorcolumn = "80"     -- Show a line at 80 characters, good for code style

-- General Behavior
opt.mouse = "a"            -- Enable mouse support in all modes
opt.undofile = true        -- Persistent undo
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.backup = false         -- Do not create backup files
opt.swapfile = false       -- Do not create swap files
opt.hlsearch = true        -- Highlight all search matches

-- Apply the color scheme
-- vim.cmd [[colorscheme tokyonight]]

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TrimTrailingWhitespace", { clear = true }),
  pattern = "*",
  callback = function()
    -- Substitute command: Delete all whitespace (\s+) at the end of a line ($).
    -- 'e' flag prevents an error if no match is found.
    vim.cmd [[%s/\s\+$//e]]
  end,
})
