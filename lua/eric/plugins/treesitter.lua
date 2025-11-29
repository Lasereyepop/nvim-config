return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        -- Import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- Configure treesitter
        treesitter.setup({ -- Enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- Enable indentation
            indent = { enable = true },
            -- Ensure these language parsers are installed
            ensure_installed = {
                -- The Big Three
                "c",
                "cpp",
                "python",
                "javascript",
                "typescript",
                "tsx", -- Essential for React/JSX

                -- Web / Config
                "html",
                "css",
                "json",
                "yaml",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",

                -- Documentation
                "markdown",
                "markdown_inline",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })

        -- Use bash parser for zsh files
        vim.treesitter.language.register("bash", "zsh")
    end,
}
