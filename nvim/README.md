# Neovim Configuration (Dotfiles)

This repository contains my personal Neovim configuration, managed with `lazy.nvim`. It aims for a fast, efficient, and feature-rich development environment.

## Features

*   **Plugin Management:** `lazy.nvim` for easy plugin management.
*   **Dashboard:** `alpha-nvim` with a custom **NEOVIM ASCII banner**, quick-access **buttons**, and **MRU (recent files)**.
*   **File Explorer:** `nvim-tree` for a modern file system explorer.
*   **LSP Support:** Language Server Protocol (LSP) integration with `nvim-lspconfig` and `mason.nvim` for intelligent code completion, diagnostics, and more.
*   **Formatting & Linting:** Automated code formatting with `conform.nvim` and linting with `nvim-lint`.
*   **Autocompletion & Snippets:** Enhanced autocompletion with `nvim-cmp` and snippet support via `LuaSnip`.
*   **Fuzzy Finder:** `telescope.nvim` for quick file navigation, text searching, and more.
*   **Colorscheme:** `tokyonight.nvim` for a beautiful dark theme.
*   **Status Line:** `lualine.nvim` for a highly customizable and informative status line.
*   **Git Integration:** `gitsigns.nvim` for Git status in the sign column and `git-blame.nvim` for inline blame information.
*   **Keymap Helper:** `which-key.nvim` to display a popup with keybindings.
*   **Editing Enhancements:**
    *   `nvim-autopairs` for automatic bracket and quote closing.
    *   `Comment.nvim` for easy code commenting.
    *   `nvim-surround` for quickly adding/changing/deleting surrounding pairs of characters.

## Setup

### Prerequisites

Before setting up these dotfiles, ensure you have the following installed:

*   **Neovim (v0.8.0 or later):** [Installation Guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)
*   **Git:** For cloning the repository and plugin management.
*   **Ripgrep (`rg`):** Required for Telescope's `live_grep` functionality.
    ```bash
    # On macOS
    brew install ripgrep
    # On Ubuntu/Debian
    sudo apt-get install ripgrep
    ```
*   **Python (with `pip`):** Required for Python LSP (`pyright`) and linters/formatters (`ruff`, `black`).
*   **Go:** Required for Go LSP (`gopls`) and linters/formatters (`gofumpt`, `golangci-lint`).
*   **Node.js & npm/yarn:** Required for Node.js/TypeScript LSP (`ts_ls`).
    ```bash
    # On macOS
    brew install node
    # On Ubuntu/Debian
    sudo apt-get install nodejs npm
    ```
*   **Java (JDK 11 or higher):** Required for Java LSP (`jdtls`). Ensure `JAVA_HOME` is set correctly.
    *   **`mfussenegger/nvim-jdtls` plugin:** This plugin is used for robust Java LSP integration. It will be installed automatically by `lazy.nvim`.
    ```bash
    # Example for macOS with Homebrew
    brew install openjdk@11
    sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
    echo 'export PATH="/usr/local/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
    echo 'export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"' >> ~/.zshrc
    source ~/.zshrc
    ```
*   **C/C++ Compiler and Headers (e.g., Clang):** Required for C/C++ LSP (`clangd`).
    ```bash
    # On macOS
    brew install llvm # Provides clangd
    # On Ubuntu/Debian
    sudo apt-get install clangd
    ```
*   **`nvim-web-devicons` compatible font:** For proper display of file icons in `nvim-tree`, `lualine`, and `alpha-nvim`. (e.g., [Nerd Fonts](https://www.nerdfonts.com/))

### Installation

1.  **Backup your existing Neovim configuration (optional):**
    ```bash
    mv ~/.config/nvim ~/.config/nvim_backup
    ```

2.  **Clone this repository:**
    ```bash
    git clone https://github.com/YOUR_GITHUB_USERNAME/nvim-dotfiles.git ~/.config/nvim
    ```
    (Replace `YOUR_GITHUB_USERNAME/nvim-dotfiles` with the actual path to your dotfiles repository if it's hosted elsewhere.)

3.  **Launch Neovim:**
    ```bash
    nvim
    ```
    `lazy.nvim` will automatically start installing the plugins. You might need to run `nvim` a few times until all plugins are installed and compiled.

4.  **Install Language Servers, Formatters, and Linters:**
    Many of the language servers, formatters, and linters are managed by `mason.nvim`.
    You can install them by running the `:Mason` command in Neovim and selecting the desired tools.
    For Python, ensure `pyright`, `ruff_format`, `black`, and `ruff` are installed.
    For Go, ensure `gopls`, `gofumpt`, and `golangci-lint` are installed.
    For Node.js/TypeScript, ensure `ts_ls` is installed.
    For C/C++, ensure `clangd` is installed.
    For Java, `jdtls` is handled by the `mfussenegger/nvim-jdtls` plugin, which will be installed automatically by `lazy.nvim`.

## Keymaps

This configuration uses `<leader>` as the primary key for custom keybindings. By default, `<leader>` is set to ` ` (space).

### Keymap Helper (`which-key.nvim`)

This configuration includes `which-key.nvim`, which is a huge help for remembering keymaps.

When you press the `<leader>` key (spacebar) in Normal mode, a popup will appear, showing you all the possible keybindings that follow. For example, if you press `<leader>` and then `f`, it will show you the Telescope file-finding options. This makes discovering and learning your keymaps much easier.

### Nvim-tree

*   `<C-b>`: Toggle NvimTree file explorer.
*   `<leader>n`: Find the current file in NvimTree.

### Commenting

*   `<leader>/`: Toggle comment for the current line or visual selection.

### LSP (Language Server Protocol)

*   `gD`: Go to Declaration.
*   `gd`: Go to Definition.
*   `K`: Show hover documentation.
*   `gi`: Go to Implementation.
*   `<C-k>`: Show signature help.
*   `<space>wa`: Add workspace folder.
*   `<space>wr`: Remove workspace folder.
*   `<space>wl`: List workspace folders.
*   `<space>D`: Go to Type Definition.
*   `<space>rn`: Rename symbol.
*   `<space>ca`: Show code actions.
*   `gr`: Go to References.
*   `<space>f`: Format current buffer.

### Telescope

*   `<leader>ff`: Find files in the project.
*   `<leader>fg`: Live grep (search text) in the project.
*   `<leader>fb`: List open buffers.
*   `<leader>fh`: Find help tags.

### Alpha (Dashboard)

The startup dashboard powered by `alpha-nvim` includes:

*   **Header:** Custom NEOVIM ASCII banner.
*   **Buttons:**
    *   `f`: Find File (`Telescope find_files`)
    *   `g`: Live Grep (`Telescope live_grep`)
    *   `n`: New File
    *   `c`: Edit Neovim Config
    *   `z`: Edit Zsh Config
    *   `w`: Jump to Work Repo
    *   `q`: Quit Neovim
*   **MRU (Most Recently Used):** Quick access to recent files.
*   **Footer:** Shows total plugins loaded and startup time.

## Customization

*   **Options:** General Neovim options are configured in `lua/config/options.lua`.
*   **Keymaps:** Custom keybindings are defined in `lua/config/keymaps.lua`.
*   **Plugins:** Plugin configurations are located in `lua/plugins/` directory. Each plugin has its own file for easy modification.
*   **Dashboard (`alpha-nvim`):** Located in `lua/plugins/alpha-nvim.lua`. Customize the header, buttons, and footer to your liking.

Feel free to explore and modify these files to tailor Neovim to your preferences.