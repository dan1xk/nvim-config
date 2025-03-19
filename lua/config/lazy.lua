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
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ import = "config.plugins" },
	{ import = "config.plugins.LSP" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	install = {
		missing = true,
	},
	performance = {
		rtp = {
			reset = false,
			paths = {},
		},
	},
})
