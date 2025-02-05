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
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			modules = {},
			sync_install = true,
			auto_install = true, -- install maintained parsers
			ensure_installed = { "python", "cpp", "lua", "vim", "json", "toml" },
			ignore_install = {}, -- List of parsers to ignore installing
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "help" }, -- list of language that will be disabled
			},
		})
	end,
}
