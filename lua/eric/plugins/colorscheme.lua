return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    -- Palette: "mix" (between material and original gruvbox)
    vim.g.gruvbox_material_foreground = "mix"

    -- Background contrast: "hard" (darkest variant)
    vim.g.gruvbox_material_background = "hard"

    -- Better performance
    vim.g.gruvbox_material_better_performance = 1

    vim.cmd("colorscheme gruvbox-material")

    -- Translucency: set Normal bg to NONE so the terminal's own
    -- background/opacity shows through. Enable transparency in your
    -- terminal emulator (iTerm2 / Kitty / Alacritty / WezTerm) to see it.
    local highlights = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "SignColumn",
      "LineNr",
      "FoldColumn",
    }
    for _, hl in ipairs(highlights) do
      vim.api.nvim_set_hl(0, hl, { bg = "NONE", ctermbg = "NONE" })
    end

    -- Cursor: gruvbox-material orange accent
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#1d2021", bg = "#e78a4e" })
    vim.api.nvim_set_hl(0, "CursorIM", { fg = "#1d2021", bg = "#e78a4e" })
    vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor"
  end,
}
