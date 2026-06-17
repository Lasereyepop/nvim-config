return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- "Welcome Back" / "Eric" in slant font (figlet -f slant)
    local ascii = {
      " _       __     __                             ____             __  ",
      "| |     / /__  / /________  ____ ___  ___     / __ )____ ______/ /__",
      "| | /| / / _ \\/ / ___/ __ \\/ __ `__ \\/ _ \\   / __  / __ `/ ___/ //_/",
      "| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/  / /_/ / /_/ / /__/ ,<  ",
      "|__/|__/\\___/_/\\___/\\____/_/ /_/ /_/\\___/  /_____/\\__,_/\\___/_/|_|  ",
      "",
      "                            ______     _     ",
      "                           / ____/____(_)____",
      "                          / __/ / ___/ / ___/",
      "                         / /___/ /  / / /__  ",
      "                        /_____/_/  /_/\\___/  ",
    }

    -- Star characters: mostly spaces so the field stays sparse
    local star_chars = { " ", " ", " ", " ", " ", " ", " ", " ", "·", "·", "⋆", "✦", "✧" }
    local star_width = 72

    local function star_row()
      local row = {}
      for _ = 1, star_width do
        table.insert(row, star_chars[math.random(#star_chars)])
      end
      return table.concat(row, "")
    end

    local function make_header()
      local lines = {}
      -- Two twinkling rows above
      table.insert(lines, star_row())
      table.insert(lines, star_row())
      table.insert(lines, "")
      -- Static ASCII art
      for _, line in ipairs(ascii) do
        table.insert(lines, line)
      end
      -- Two twinkling rows below
      table.insert(lines, "")
      table.insert(lines, star_row())
      table.insert(lines, star_row())
      return lines
    end

    dashboard.section.header.val = make_header()

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>AutoSession restore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    -- Twinkling star animation (only re-generates the star rows, ASCII stays fixed)
    local timer = vim.uv.new_timer()
    local alpha_buf = nil

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        alpha_buf = vim.api.nvim_get_current_buf()
        timer:start(0, 120, vim.schedule_wrap(function()
          if not alpha_buf or not vim.api.nvim_buf_is_valid(alpha_buf) then
            timer:stop()
            return
          end
          if vim.api.nvim_get_current_buf() ~= alpha_buf then
            timer:stop()
            return
          end
          dashboard.section.header.val = make_header()
          pcall(alpha.redraw)
        end))
      end,
    })

    vim.api.nvim_create_autocmd("BufUnload", {
      callback = function(ev)
        if ev.buf == alpha_buf then
          timer:stop()
        end
      end,
    })
  end,
}
