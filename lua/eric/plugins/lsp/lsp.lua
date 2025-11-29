return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true }, -- Auto rename imports when file moves
    { "folke/lazydev.nvim", opts = {} }, -- Better Lua dev experience
  },
  config = function()
    -- 1. Setup Mason
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- 2. Setup Capabilities (Autocompletion)
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    -- Enable C++ specific encoding (prevents weird offset errors)
    capabilities.offsetEncoding = { "utf-16" }

    -- 3. Setup Mason-LSPConfig
    local lspconfig = require("lspconfig")
    
    require("mason-lspconfig").setup({
      -- ONLY put LSPs here. Do not put pylint/prettier/black here.
      ensure_installed = {
        "lua_ls",
        
        -- C++
        "clangd",
        "codelldb",
        
        -- Python
        "pyright", 
        
        -- Web (JS/TS/HTML/CSS)
        "ts_ls", -- The new name for tsserver
        "html",
        "cssls",
        "tailwindcss",
        "emmet-language-server",

        -- Shellscripts
        "bashls",
      },
      
      -- 4. Handlers (The automatic setup loop)
      handlers = {
        -- The "Default" handler for any server not manually overridden below
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- C++ SPECIAL CONFIG (High Performance)
        ["clangd"] = function()
          lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
              "clangd",
              "--background-index",        -- Index project in background
              "--clang-tidy",              -- Enable clang-tidy linting
              "--header-insertion=iwyu",   -- Auto-import headers (Include-What-You-Use)
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
            },
            init_options = {
              usePlaceholders = true,
              completeUnimported = true,
              clangdFileStatus = true,
            },
          })
        end,

        -- Python Config
        ["pyright"] = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
             settings = {
                python = {
                  analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true
                  }
                }
             }
          })
        end,

        -- Lua Config
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { library = { vim.env.VIMRUNTIME } },
              },
            },
          })
        end,
      }
    })

    -- 5. UI CONFIGURATION (The missing part)
    local severity = vim.diagnostic.severity
    vim.diagnostic.config({
      virtual_text = true, -- Show error message after the line of code
      signs = {
        text = {
          [severity.ERROR] = " ",
          [severity.WARN]  = " ",
          [severity.HINT]  = "󰠠 ",
          [severity.INFO]  = " ",
        },
      },
    })
    
    -- Enable Inlay Hints (Great for C++ types!)
    -- Checks if the feature exists (Neovim 0.10+) before enabling
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true)
    end

    -- 6. Keymaps (Telescope Integration)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definition"
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Code Actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Buffer Diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Line Diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Prev Diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Next Diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Hover Doc"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        
        -- C++ Header/Source switch (requires clangd)
        opts.desc = "Switch Source/Header (C++)"
        keymap.set("n", "<leader>gs", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
      end,
    })
  end,
}
