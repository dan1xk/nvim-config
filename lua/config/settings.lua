-- ================================
--       Neovim Configuration
--       Custom Settings & Options
-- ================================

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- General settings
opt.number = true
opt.relativenumber = false
opt.clipboard:append("unnamedplus")
opt.mouse = "a"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.completeopt = "menuone,noselect"
opt.backupcopy = "yes"

-- Indentation settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Display settings
opt.wrap = false
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showmode = false
