vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- For conciseness

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs and Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line Wrapping
opt.wrap = false

-- Search Setting
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true
vim.cmd([[ 
  highlight CursorLine guibg=NONE ctermbg=NONE gui=underline cterm=underline 
]])

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " " } -- Replace ~ with blank at end of buffer

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Splitscreen
opt.splitright = true
opt.splitbelow = true

-- ==========================================
--  AI & AUTO-RELOAD CONFIGURATION
-- ==========================================

-- 1. Enable autoread
opt.autoread = true

-- 2. Reduce updatetime to 250ms (default is 4000ms)
--    This makes CursorHold events fire much faster.
opt.updatetime = 250

-- 3. AUTO-SAVE when you leave Neovim entirely (FocusLost)
--    This fires when you tab away to the AI pane in tmux, ensuring the
--    disk has your latest work before the AI reads/edits it. We do NOT
--    save on BufLeave/WinLeave: moving between splits inside nvim would
--    otherwise trigger a blocking format_on_save on every switch.
vim.api.nvim_create_autocmd({ "FocusLost" }, {
    callback = function()
        if vim.bo.modified and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
            vim.cmd("silent! update")
        end
    end,
})

-- 4. AUTO-LOAD when you return (FocusGained)
--    Forces Neovim to check the disk for changes.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    callback = function()
        if vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
})

-- 5. NOTIFICATION (Optional)
--    Lets you know the update actually happened.
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    callback = function()
        vim.notify("File updated from disk!", vim.log.levels.INFO)
    end,
})
