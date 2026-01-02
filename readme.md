# Dotfiles

This repository contains my personal dotfiles for Neovim and terminal setup, designed for a productive and aesthetically pleasing development environment.

## Structure

```
dotfiles/
├── nvim/             # Neovim configuration
└── terminal/         # Terminal setup (Zsh, Oh My Posh, Zellij, Ghostty)
```

## Neovim Configuration

The `nvim/` directory houses my Neovim configuration, managed with `lazy.nvim`. It provides a modern and efficient text editing experience with custom keybindings, a carefully selected colorscheme, and various quality-of-life improvements. For more detailed information, refer to `nvim/README.md`.

## Terminal Setup

The `terminal/` directory contains all necessary scripts and configuration files to set up a customized terminal environment. This includes:

-   **Shell**: Zsh with enhancements.
-   **Prompt**: Oh My Posh for a rich and informative command prompt.
-   **Multiplexer**: Zellij for efficient terminal session management.
-   **Emulator**: Ghostty for a fast and customizable terminal interface.
-   **Dependencies**: Managed via Homebrew, including essential fonts.

### Installation

The `terminal/setup.sh` script automates the process of installing dependencies via Homebrew, linking configuration files, and updating your `.zshrc` to integrate the terminal components.

To set up your terminal, run:

```bash
bash terminal/setup.sh
```

After running the script, restart your terminal or `source ~/.zshrc` for changes to take effect. For more detailed information on each component and their specific configurations, refer to `terminal/readme.md`.
