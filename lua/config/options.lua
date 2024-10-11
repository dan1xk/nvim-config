-- ================================
--       Neovim Configuration
--       Custom Settings & Options
-- ================================

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- General settings
opt.number = true                    -- Enable line numbers
opt.relativenumber = false           -- Disable relative line numbers
opt.clipboard:append("unnamedplus")  -- Use system clipboard
opt.mouse = "a"                      -- Enable mouse support in all modes
opt.scrolloff = 8                    -- Keep 8 lines visible when scrolling
opt.sidescrolloff = 8                -- Keep 8 columns visible when side-scrolling
opt.completeopt = "menuone,noselect" -- Better completion experience

-- Indentation settings
opt.tabstop = 2                     -- Number of spaces that a <Tab> counts for
opt.shiftwidth = 2                  -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true                -- Convert tabs to spaces
opt.autoindent = true               -- Auto-indent new lines
opt.smartindent = true              -- Smarter auto-indentation based on syntax

-- Display settings
opt.wrap = false                    -- Disable line wrapping
opt.cursorline = true               -- Highlight the current line
opt.termguicolors = true            -- Enable 24-bit RGB colors
opt.background = "dark"             -- Set background color to dark
opt.signcolumn = "yes"              -- Always show the sign column
opt.laststatus = 3                  -- Global status line
opt.showmode = false                -- Disable showing mode like --
