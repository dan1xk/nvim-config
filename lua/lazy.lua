-- ================================
--         Lazy.nvim Setup
-- ================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- Prepend the lazy.nvim path to runtime path
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup({
	{ import = "config.plugins" }, -- Import main plugins configuration
	{ import = "config.plugins.lsp" }, -- Import LSP-related plugins configuration
}, {
	checker = {
		enabled = true, -- Enable the update checker
		notify = false, -- Disable notifications
	},
	change_detection = {
		notify = false, -- Disable notifications for change detection
	},
	performance = {
		rtp = {
			-- Disable some runtime plugins to improve performance
			disabled_plugins = {
				"gzip", -- Disable gzip support
				-- "matchit",                   -- Uncomment to disable matchit
				-- "matchparen",                -- Uncomment to disable matchparen
				"netrwPlugin", -- Disable netrw for file browsing
				"tarPlugin", -- Disable tar support
				"tohtml", -- Disable HTML conversion
				"tutor", -- Disable tutor mode
				"zipPlugin", -- Disable zip support
			},
		},
	},
})
