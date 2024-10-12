-- ================================
--        Lazy.nvim Configuration
-- ================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", --
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with plugin configurations
require("lazy").setup({
	{ import = "config.plugins" }, -- Load general plugin configurations
	{ import = "config.plugins.LSP" }, -- Load LSP plugin configurations
}, {
	checker = {
		enabled = true, -- Enable the plugin checker
		notify = false, -- Disable notifications for updates
	},
	change_detection = {
		notify = false, -- Disable notifications for file changes
	},
	install = {
		missing = true, -- Automatically install missing plugins
	},
	performance = {
		rtp = {
			reset = false, -- Do not reset runtime path
			paths = {}, -- Specify additional paths if needed
		},
	},
})

