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
*   **Buffer Bar:** `bufferline.nvim` for a VS Code-style horizontal list of open files.
*   **Status Line:** `lualine.nvim` for a highly customizable and informative status line.
*   **Git Integration:** `gitsigns.nvim` and `git-blame.nvim` for seamless Git workflows.
*   **Keymap Helper:** `which-key.nvim` to display a popup with keybindings.
*   **Markdown Render:** `render-markdown.nvim` for inline rendered Markdown preview inside Neovim.
*   **Editing Enhancements:**
    *   `nvim-autopairs` for automatic bracket and quote closing.
    *   `Comment.nvim` for easy code commenting.
    *   `nvim-surround` for quickly manipulating surrounding pairs of characters.

## Setup
On first launch, `lazy.nvim` installs the plugins and `mason.nvim` bootstraps the configured LSP servers, formatters, and linters automatically. Keep Neovim open until the initial Mason installs finish, then restart once.

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

### `render-markdown.nvim` (Inline Markdown Render)

*   **What it is:** Renders Markdown directly inside the Neovim buffer — no browser, no split window needed. Headers, bold/italic, tables, code blocks, checkboxes, and bullet points are all styled visually, similar to VSCode's Markdown preview but without leaving the editor.
*   **How to use it:** Rendering activates automatically when you open a `.md` file.

    | Keymap / Command          | Description                        |
    |---------------------------|------------------------------------|
    | `<leader>mp`              | Toggle rendered view on/off        |
    | `:RenderMarkdown toggle`  | Toggle rendered view on/off        |
    | `:RenderMarkdown enable`  | Enable rendering                   |
    | `:RenderMarkdown disable` | Disable rendering                  |

*   **Notes:**
    *   No external dependencies — no Node.js or browser required.
    *   Requires `nvim-treesitter` with the `markdown` parser (installed automatically).

### `bufferline.nvim` (Open File Bar)

*   **What it is:** Adds a horizontal buffer bar so open files are visible at the top of Neovim, closer to the VS Code workflow.
*   **How to use it:** The bar updates automatically as buffers open and close.

    | Keymap | Description |
    |--------|-------------|
    | `<S-l>` | Move to next buffer |
    | `<S-h>` | Move to previous buffer |
    | `<leader>bd` | Close current buffer |

## Keymaps

Leader key: `Space`

### General

| Keymap | Action |
|--------|--------|
| `jk` | Exit insert mode |
| `<leader>nh` | Clear search highlights |
| `<leader>+` | Increment number |
| `<leader>-` | Decrement number |

### Window Management

| Keymap | Action |
|--------|--------|
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Equalize split sizes |
| `<leader>sq` | Close current split |

### Tab Management

| Keymap | Action |
|--------|--------|
| `<leader>to` | Open new tab |
| `<leader>tq` | Close current tab |
| `<leader>tn` | Next tab |
| `<leader>tp` | Previous tab |
| `<leader>tf` | Open current buffer in a new tab |

### Navigation And Search

| Keymap | Action |
|--------|--------|
| `<C-b>` | Toggle NvimTree |
| `<leader>n` | Reveal current file in NvimTree |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Find help tags |
| `<leader>fd` | Find diagnostics |
| `<leader>fr` | Find LSP references |
| `<leader>fs` | Find document symbols |
| `s` | Flash jump |
| `S` | Flash Treesitter jump |
| `r` | Remote Flash in operator-pending mode |
| `R` | Flash Treesitter search |

### Buffers And Git

| Keymap | Action |
|--------|--------|
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<leader>bd` | Close buffer |
| `<leader>gb` | Toggle inline git blame |
| `<leader>gg` | Open LazyGit |

### Diagnostics And TODOs

| Keymap | Action |
|--------|--------|
| `<leader>xx` | Toggle Trouble diagnostics |
| `<leader>xb` | Buffer diagnostics in Trouble |
| `<leader>xs` | Symbols in Trouble |
| `<leader>xq` | Quickfix list in Trouble |
| `<leader>td` | Show TODOs in Trouble |
| `]t` | Next TODO |
| `[t` | Previous TODO |

### Editing

| Keymap | Action |
|--------|--------|
| `<leader>/` | Toggle comment |
| `<leader>mp` | Toggle Markdown render |

### LSP

These are buffer-local and become available when an LSP server attaches to the file.

| Keymap | Action |
|--------|--------|
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gr` | List references |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format buffer |

## Customization
(Customization section remains the same)
