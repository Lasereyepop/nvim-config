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
vim.cmd [[ 
  highlight CursorLine guibg=NONE ctermbg=NONE gui=underline cterm=underline 
]]

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Splitscreen
opt.splitright = true
opt.splitbelow = true
