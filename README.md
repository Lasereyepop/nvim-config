# Eric's Neovim Config

A personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim), structured for C++, Python, Rust, and web development.

## Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
└── lua/eric/
    ├── core/
    │   ├── options.lua       # Editor settings
    │   └── keymaps.lua       # Core keybindings
    ├── lazy.lua              # Plugin manager bootstrap
    └── plugins/
        ├── lsp/
        │   ├── lsp.lua       # LSP config + keymaps
        │   └── mason.lua     # Mason tool installer
        └── *.lua             # Individual plugin configs
```

## Plugins

### UI
| Plugin | Purpose |
|--------|---------|
| `folke/tokyonight.nvim` | Colorscheme (night style, pure black OLED bg) |
| `goolord/alpha-nvim` | Start screen dashboard |
| `nvim-lualine/lualine.nvim` | Status line with custom theme |
| `akinsho/bufferline.nvim` | Tab-style buffer line |
| `nvim-tree/nvim-tree.lua` | File explorer |
| `folke/which-key.nvim` | Keymap hints popup |
| `stevearc/dressing.nvim` | Improved UI for `vim.ui.select` / `vim.ui.input` |
| `lukas-reineke/indent-blankline.nvim` | Indent guides |

### Navigation & Search
| Plugin | Purpose |
|--------|---------|
| `nvim-telescope/telescope.nvim` | Fuzzy finder |
| `nvim-telescope/telescope-fzf-native.nvim` | Native FZF sorter for Telescope |
| `vim-maximizer` | Toggle maximized splits |

### LSP & Completion
| Plugin | Purpose |
|--------|---------|
| `neovim/nvim-lspconfig` | LSP client configuration |
| `williamboman/mason.nvim` | LSP/tool installer |
| `williamboman/mason-lspconfig.nvim` | Bridge between mason and lspconfig |
| `WhoIsSethDaniel/mason-tool-installer.nvim` | Install formatters/linters via mason |
| `hrsh7th/nvim-cmp` | Autocompletion engine |
| `L3MON4D3/LuaSnip` | Snippet engine |
| `rafamadriz/friendly-snippets` | VSCode-style snippet collection |
| `onsails/lspkind.nvim` | VSCode-style icons in completion menu |

**Installed LSPs:** `lua_ls`, `clangd` (C++), `pyright` (Python), `ts_ls` (JS/TS), `html`, `cssls`, `tailwindcss`, `emmet-language-server`, `bashls`, `rust_analyzer`

### Formatting & Linting
| Plugin | Purpose |
|--------|---------|
| `stevearc/conform.nvim` | Auto-format on save |
| `mfussenegger/nvim-lint` | Async linting |

**Formatters:** `prettierd` (web), `stylua` (Lua), `black`+`isort` (Python), `clang-format` (C/C++), `shfmt` (shell)

**Linters:** `eslint_d` (JS/TS), `shellcheck` (bash/sh)

### Git
| Plugin | Purpose |
|--------|---------|
| `lewis6991/gitsigns.nvim` | Git hunk signs and actions |
| `kdheepak/lazygit.nvim` | LazyGit TUI in a float |

### Editing
| Plugin | Purpose |
|--------|---------|
| `nvim-treesitter/nvim-treesitter` | Syntax highlighting + smart indentation |
| `windwp/nvim-autopairs` | Auto-close brackets/quotes |
| `kylechui/nvim-surround` | Surround text with delimiters |
| `gbprod/substitute.nvim` | Motion-based substitution |
| `folke/todo-comments.nvim` | Highlight and search TODO/FIXME/etc. |
| `folke/trouble.nvim` | Pretty diagnostics list |

### Sessions
| Plugin | Purpose |
|--------|---------|
| `rmagatti/auto-session` | Per-directory session save/restore |

## Keymaps

**Leader:** `Space`

### General
| Key | Action |
|-----|--------|
| `jk` | Exit insert/terminal mode |
| `<leader>nh` | Clear search highlights |
| `<leader>+` / `<leader>-` | Increment / decrement number |

### Windows & Tabs
| Key | Action |
|-----|--------|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>se` | Equalize split sizes |
| `<leader>sx` | Close split |
| `<leader>to` | New tab |
| `<leader>tx` | Close tab |
| `<leader>tn` / `<leader>tp` | Next / prev tab |
| `<leader>tf` | Open current buffer in new tab |

### File Explorer (nvim-tree)
| Key | Action |
|-----|--------|
| `<leader>ee` | Toggle file explorer |
| `<leader>ef` | Reveal current file in explorer |
| `<leader>ec` | Collapse explorer |
| `<leader>er` | Refresh explorer |

### Telescope
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fs` | Live grep |
| `<leader>fc` | Grep string under cursor |
| `<leader>ft` | Find TODOs |
| `<leader>fk` | Find keymaps |

### LSP
| Key | Action |
|-----|--------|
| `gR` | References (Telescope) |
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `gi` | Implementations (Telescope) |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>D` | Buffer diagnostics (Telescope) |
| `<leader>d` | Line diagnostics float |
| `[d` / `]d` | Prev / next diagnostic |
| `<leader>gs` | Switch C++ source/header (clangd) |

### Formatting & Linting
| Key | Action |
|-----|--------|
| `<leader>mp` | Format file or selection |
| `<leader>l` | Trigger linting |

### Git (gitsigns)
| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / prev hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hB` | Toggle line blame |
| `<leader>hd` | Diff this |
| `<leader>lg` | Open LazyGit |

### Trouble
| Key | Action |
|-----|--------|
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |
| `<leader>xt` | TODOs |

### Sessions
| Key | Action |
|-----|--------|
| `<leader>wr` | Restore session |
| `<leader>ws` | Save session |

### Substitution (substitute.nvim)
| Key | Action |
|-----|--------|
| `<leader>r` | Substitute with motion |
| `<leader>rr` | Substitute line |
| `<leader>R` | Substitute to end of line |

### TODO Comments
| Key | Action |
|-----|--------|
| `]t` / `[t` | Next / prev TODO comment |

## Options

- **Line numbers:** relative + absolute
- **Indentation:** 2 spaces, expandtab
- **Search:** case-insensitive unless capitals used (`ignorecase` + `smartcase`)
- **Cursor line:** underline style (no background)
- **Clipboard:** system clipboard (`unnamedplus`)
- **Splits:** open right and below
- **Auto-save/reload:** saves on focus loss, reloads on focus gain (AI agent friendly)
