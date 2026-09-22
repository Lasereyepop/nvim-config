return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ensure_installed = {
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
        }

        local installed = require("nvim-treesitter.config").get_installed()
        local to_install = vim.iter(ensure_installed)
            :filter(function(parser) return not vim.tbl_contains(installed, parser) end)
            :totable()
        if #to_install > 0 then
            require("nvim-treesitter").install(to_install)
        end

        -- The old ensure_installed/highlight.enable/indent.enable API (and
        -- incremental_selection) went away in the nvim-treesitter rewrite.
        -- Highlighting + indent are now wired up per-buffer via core APIs.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        -- Use bash parser for zsh files
        vim.treesitter.language.register("bash", "zsh")
    end,
}
