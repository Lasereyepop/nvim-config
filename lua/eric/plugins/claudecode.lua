local function claude_send(text)
  vim.cmd("ClaudeCodeFocus")
  vim.defer_fn(function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].buftype == "terminal" then
        if vim.api.nvim_buf_get_name(buf):match("claude") then
          vim.fn.chansend(vim.bo[buf].channel, text)
          return
        end
      end
    end
  end, 200)
end

return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal = {
      provider = "snacks",
      auto_close = true,
      snacks_win_opts = {
        position = "float",
        width = 0.85,
        height = 0.85,
        border = "none",
        keys = {
          claude_hide = {
            "<leader>ac",
            function(self) self:hide() end,
            mode = "t",
            desc = "Hide Claude",
          },
        },
      },
    },
  },
  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file from tree",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    { "<leader>ap", function() claude_send("@agent-plan ") end, desc = "Plan" },
    { "<leader>av", function() claude_send("@agent-reviewer ") end, desc = "Review" },
  },
}
