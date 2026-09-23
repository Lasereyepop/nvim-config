return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  config = function()
    vim.keymap.set({ "n", "x" }, "<C-a>", function()
      require("opencode").ask("@this: ", { submit = true })
    end)
    vim.keymap.set({ "n", "x" }, "<C-x>", function()
      require("opencode").select()
    end)
    vim.keymap.set({ "n", "t" }, "<C-.>", function()
      require("opencode").toggle()
    end)
  end,
}
