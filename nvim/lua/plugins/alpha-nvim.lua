return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  cond = function()
    return vim.fn.argc() == 0
  end,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 🎨 Header
    dashboard.section.header.val = {
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[         🚀 Welcome to NEOVIM — Config by Lori 🚀    ]],
    }

    -- 🖱️ Buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("g", "  Live Grep", ":Telescope live_grep<CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
      dashboard.button("s", "󱂬  Restore Session", ":SessionRestore<CR>"),
      dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("z", "  Zsh Config", ":e ~/.zshrc<CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
    }

    -- ⚡ Footer with random quote
    local function footer()
      local stats = require("lazy").stats()
      local plugins_text = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. stats.startuptime .. "ms"

      local quotes = {
        "Read books!",
        "All Cops Are Bastard",
        "Keep coding, Bro 🚀",
        "Stay focused. Ship things.",
        "Bug-free code? One can dream...",
        "Eat ⌨️ Sleep 💤 Code 💻 Repeat 🔁",
      }
      local quote = quotes[math.random(#quotes)]

      return plugins_text .. " | " .. quote
    end
    dashboard.section.footer.val = footer()

    -- 🎨 Random Colors
    local colors = { "String", "Identifier", "Keyword", "Number", "Type", "Constant", "Function", "Special" }
    local function random_hl()
      return colors[math.random(#colors)]
    end

    -- Assign random highlights
    dashboard.section.header.opts.hl = random_hl()
    dashboard.section.buttons.opts.hl = random_hl()
    dashboard.section.footer.opts.hl = random_hl()

    -- 🚀 Setup
    alpha.setup(dashboard.config)

    -- Redraw on Lazy start to refresh random colors
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        alpha.redraw()
      end,
    })
  end,
}
