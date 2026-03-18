# Dotfiles

My personal development environment for **C, Python, Go, Rust, and JavaScript/TypeScript** — optimized for speed, keyboard-first workflow, and multi-language engineering.

## Structure

```
dotfiles/
├── nvim/             # Neovim configuration (lazy.nvim)
└── terminal/         # Terminal setup (Zsh, Oh My Posh, Zellij, Ghostty) — Git submodule
```

## Quick Start

```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/chud-lori/dotfiles
cd dotfiles

# Terminal setup (installs brew deps, symlinks configs, patches .zshrc)
cd terminal && make install

# Neovim: symlink config
ln -sf $(pwd)/nvim ~/.config/nvim

# Open nvim — lazy.nvim auto-installs plugins on first launch
nvim
```

If you already cloned without submodules:
```bash
git submodule update --init --recursive
```

---

## Neovim

Plugin manager: [`lazy.nvim`](https://github.com/folke/lazy.nvim)

### Language Support

| Language | LSP | Formatter | Linter |
|----------|-----|-----------|--------|
| C / C++ | clangd (background index, clang-tidy) | clang-format | clangtidy |
| Python | pyright | ruff + black | ruff |
| Go | gopls (staticcheck, hints) | gofumpt | golangci-lint |
| Rust | rust-analyzer (clippy, inlay hints) | rustfmt | — |
| JS / TS | ts_ls | prettier | eslint_d |
| JSON / YAML / Markdown | — | prettier | — |

Install LSP servers and formatters via Mason (inside Neovim):
```
:Mason
```

### Plugins

| Category | Plugin | Purpose |
|----------|--------|---------|
| File Nav | nvim-tree | File explorer (`Ctrl+b`) |
| Fuzzy Find | telescope.nvim | Files, grep, buffers, LSP |
| LSP | mason + nvim-lspconfig | Language server management |
| Completion | nvim-cmp + LuaSnip | Autocompletion and snippets |
| Formatting | conform.nvim | Auto-format on save |
| Linting | nvim-lint | Lint on write |
| Syntax | nvim-treesitter | Advanced highlighting + text objects |
| Diagnostics | trouble.nvim | Diagnostics panel |
| TODO | todo-comments.nvim | Highlight TODO/FIXME/HACK/NOTE |
| Git TUI | lazygit.nvim | Full git UI inside Neovim |
| Navigation | flash.nvim | Fast jump anywhere on screen |
| UI | indent-blankline | Indent guides with scope |
| UI | fidget.nvim | LSP progress notifications |
| UI | lualine | Status line |
| UI | alpha-nvim | Dashboard |
| UI | which-key | Keymap popup |
| Git | gitsigns + git-blame | Gutter signs + inline blame |
| Editing | autopairs, surround, Comment | Quality-of-life editing |
| Theme | catppuccin (mocha) | Colorscheme |

### Key Keymaps

**Leader key: `Space`**

| Keymap | Action |
|--------|--------|
| `jk` | Exit insert mode |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fd` | Find diagnostics |
| `<leader>fr` | Find references |
| `<leader>fs` | Find document symbols |
| `<C-b>` | Toggle file explorer |
| `<leader>gg` | Open LazyGit |
| `<leader>xx` | Toggle diagnostics panel |
| `<leader>xb` | Buffer diagnostics |
| `<leader>xs` | Symbols panel |
| `<leader>td` | Show TODOs |
| `]t` / `[t` | Next / prev TODO |
| `s` | Flash jump (any position) |
| `S` | Flash treesitter select |
| `<Shift-l>` / `<Shift-h>` | Next / prev buffer |
| `<leader>bd` | Close buffer |
| `<leader>gb` | Toggle git blame |
| `<leader>sv` / `<leader>sh` | Split vertical / horizontal |
| `<leader>/` | Toggle comment |
| `gd` / `gD` | Go to definition / declaration |
| `K` | Hover docs |
| `<space>rn` | Rename symbol |
| `<space>ca` | Code action |
| `<space>f` | Format buffer |

---

## Terminal

See [`terminal/readme.md`](terminal/readme.md) for full details.

**Stack:** Ghostty · Zellij · Zsh · Oh My Posh · JetBrains Mono Nerd Font

**Zellij workspace tabs:** AI · Code · Git · Run · Infra · Shell

---

## License

Personal dotfiles. Use, fork, or adapt freely.
