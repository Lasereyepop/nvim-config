return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- List of servers for mason to install
      ensure_installed = {
        -- Core Languages
        "lua_ls",
        "clangd",                -- C++
        "pyright",               -- Python
        "ts_ls",                 -- JS/TS

        -- Web / Frontend
        "html",
        "cssls",
        "tailwindcss",
        "emmet_language_server",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- WEB (JS/TS/HTML/CSS)
        "prettierd",   -- The faster "Daemon" version of Prettier
        "eslint_d",    -- The faster "Daemon" version of ESLint

        -- PYTHON
        "black",       -- Formatter
        "isort",       -- Import Sorter

        -- C++
        "codelldb",    -- Debugger (CRITICAL for C++)
        "clang-format",-- Formatter

        -- LUA
        "stylua",      -- Formatter

        -- SHELL / BASH
        "shfmt",       -- Formatter
        "shellcheck",  -- Linter (works with bashls)
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
