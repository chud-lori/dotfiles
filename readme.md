# Dotfiles

This repository contains my personal dotfiles for Neovim and terminal setup, designed for a productive and aesthetically pleasing development environment.

## Structure

```
dotfiles/
├── nvim/             # Neovim configuration
└── terminal/         # Terminal setup (Zsh, Oh My Posh, Zellij, Ghostty) - Git submodule
```

## Getting Started

### Cloning the Repository

Since the `terminal/` directory is a Git submodule, you need to clone this repository with submodule initialization:

```bash
git clone --recurse-submodules `https://github.com/chud-lori/dotfiles`
cd dotfiles
```

If you've already cloned the repository without submodules, you can initialize them afterwards:

```bash
git submodule update --init --recursive
```

### Setup Instructions

Each subdirectory contains its own README with detailed setup instructions:

- **Neovim**: See `nvim/README.md` for Neovim configuration setup
- **Terminal**: See `terminal/readme.md` for terminal environment setup

Please follow the instructions in each README to set up the respective components.

## Neovim Configuration

The `nvim/` directory houses my Neovim configuration, managed with `lazy.nvim`. It provides a modern and efficient text editing experience with custom keybindings, a carefully selected colorscheme, and various quality-of-life improvements. For more detailed information, refer to `nvim/README.md`.

## Terminal Setup

The `terminal/` directory contains all necessary scripts and configuration files to set up a customized terminal environment. This includes:

-   **Shell**: Zsh with enhancements.
-   **Prompt**: Oh My Posh for a rich and informative command prompt.
-   **Multiplexer**: Zellij for efficient terminal session management.
-   **Emulator**: Ghostty for a fast and customizable terminal interface.
-   **Dependencies**: Managed via Homebrew, including essential fonts.

For detailed installation instructions and setup, refer to `terminal/readme.md`.
