
return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
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
      [[                🚀 Welcome to NEOVIM 🚀             ]],
    }

    -- 🖱️ Buttons (like bookmarks + actions)
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("g", "  Live Grep", ":Telescope live_grep<CR>"),
      dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("z", "  Zsh Config", ":e ~/.zshrc<CR>"),
      dashboard.button("w", "  Work Repo", ":cd ~/repo/99-search | Telescope find_files<CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
    }

    -- ⚡ Footer
    local function footer()
      local stats = require("lazy").stats()
      return "⚡ Neovim loaded " .. stats.count .. " plugins in " .. stats.startuptime .. "ms ⚡"
    end
    dashboard.section.footer.val = footer()

    -- 🚀 Setup
    alpha.setup(dashboard.config)
  end,
}
