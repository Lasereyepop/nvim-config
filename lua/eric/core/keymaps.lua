vim.g.mapleader = " "

local keymap = vim.keymap -- For conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode with jk" })

-- vim-tmux-navigator only maps C-hjkl in normal mode by default, so inside
-- an nvim :terminal buffer they hit the shell (C-h = backspace, etc.)
-- instead of navigating panes. Wire terminal mode to the same commands.
keymap.set("t", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "Tmux navigate left" })
keymap.set("t", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "Tmux navigate down" })
keymap.set("t", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "Tmux navigate up" })
keymap.set("t", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "Tmux navigate right" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/Decrement Numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- Increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- Make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- Close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- Open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- Close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  Go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  Go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  Move current buffer to new tab
