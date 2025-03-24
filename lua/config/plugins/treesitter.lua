-- ================================
--         Treesitter Plugin
-- ================================

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			modules = {},
			sync_install = true,
			auto_install = true,
			ensure_installed = {
				"python",
				"toml",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"rust",
				"lua",
				"cmake",
				"dockerfile",
				"jsonc",
				"json",
				"scss",
				"yaml",
			},
			ignore_install = {},
			highlight = {
				enable = true,
				disable = { "help" },
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
