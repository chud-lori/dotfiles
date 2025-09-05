# Neovim Configuration (Dotfiles)

This repository contains my personal Neovim configuration, managed with `lazy.nvim`. It aims for a fast, efficient, and feature-rich development environment.

## Features

*   **Plugin Management:** `lazy.nvim` for easy plugin management.
*   **Code Parsing:** `nvim-treesitter` for advanced, accurate syntax highlighting.
*   **Dashboard:** `alpha-nvim` with a custom **NEOVIM ASCII banner** and quick-access **buttons**.
*   **File Explorer:** `nvim-tree` for a modern file system explorer.
*   **LSP Support:** `nvim-lspconfig` and `mason.nvim` for intelligent code completion, diagnostics, and more.
*   **Formatting & Linting:** `conform.nvim` and `nvim-lint` for automated code styling.
*   **Autocompletion & Snippets:** `nvim-cmp` and `LuaSnip` for a powerful autocompletion engine.
*   **Fuzzy Finder:** `telescope.nvim` for quick file navigation and text searching.
*   **Colorscheme:** `catppuccin/nvim` for a beautiful, high-contrast dark theme.
*   **Status Line:** `lualine.nvim` for a highly customizable and informative status line.
*   **Git Integration:** `gitsigns.nvim` and `git-blame.nvim` for seamless Git workflows.
*   **Keymap Helper:** `which-key.nvim` to display a popup with keybindings.
*   **Editing Enhancements:**
    *   `nvim-autopairs` for automatic bracket and quote closing.
    *   `Comment.nvim` for easy code commenting.
    *   `nvim-surround` for quickly manipulating surrounding pairs of characters.

## Setup
(Setup instructions remain the same)

## Core Editing Plugins

This section explains the key plugins that enhance the day-to-day editing experience and how to use them.

### `nvim-treesitter` (Better Highlighting)

*   **What it is:** `nvim-treesitter` is a powerful code parsing engine. Instead of using simple patterns to guess what your code is, it builds a complete syntax tree, just like a compiler.
*   **Main Benefit:** This results in far more accurate and detailed syntax highlighting. It can easily tell the difference between a variable, a function call, and a keyword, and color them differently, making code much easier to read and understand.
*   **How to use it:** It works automatically! After installation, it downloads the correct parser for your programming language in the background. The enhanced highlighting will be applied as soon as the parser is ready.

### `nvim-autopairs` (Automatic Brackets and Quotes)

*   **What it is:** This plugin automatically closes pairs of brackets, parentheses, and quotes as you type.
*   **How to use it:** It works automatically in Insert mode. There are no keymaps to remember.
    *   When you type an opening `(`, `[`, `{`, or `"`, the corresponding closing character is added automatically, and your cursor is placed in the middle.
    *   It's smart: if you're inside an existing pair like `()` and press `)`, it will move your cursor past the closing parenthesis instead of inserting a new one.

### `nvim-surround` (Editing Surrounding Pairs)

*   **What it is:** A powerful tool for adding, changing, and deleting "surrounding" pairs like quotes, brackets, and even HTML tags. This is one of the most useful editing plugins you'll have.
*   **How to use it:** The commands are used in **Normal mode**. The pattern is typically `[action][surrounding]`.

    *   **`cs` - Change Surrounding:**
        *   **Example:** Change `"hello"` to `'hello'`.
        *   **Action:** With your cursor anywhere on the string, type `cs"'`.

    *   **`ds` - Delete Surrounding:**
        *   **Example:** Change `(some text)` to `some text`.
        *   **Action:** With your cursor on the text, type `ds(`.

    *   **`ys` - You Surround (Add Surrounding):** This one is followed by a motion or text object.
        *   **Example:** Change `hello` to `"hello"`.
        *   **Action:** With your cursor on the word `hello`, type `ysiw"` (`iw` is the text object for "inner word").

## Keymaps
(Keymap sections remain the same)

## Customization
(Customization section remains the same)
