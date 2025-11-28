return {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {
    -- 1. Use the darkest base style
    style = "night", 

    -- 2. Flatten the UI (remove different background colors for sidebars/floats)
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },

    -- 3. Force the background to be pure black (OLED style)
    on_colors = function(colors)
      colors.bg = "#000000"
      colors.bg_dark = "#000000"
      colors.bg_float = "#000000"
      colors.bg_sidebar = "#000000"
      colors.bg_popup = "#000000"
      
      -- Darken the comments so they aren't as bright
      colors.comment = "#565f89" 
    end,

    -- 4. Minimalist Tweaks
    on_highlights = function(hl, c)
      -- Remove the background from the column where line numbers sit
      hl.LineNr = { fg = c.dark3, bg = "NONE" }
      hl.SignColumn = { bg = "NONE" }
      
      -- Hide the "~" characters at the end of the buffer
      hl.EndOfBuffer = { fg = "#000000" }
      
      -- Make the vertical split line subtle
      hl.WinSeparator = { fg = c.dark3 }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
}
