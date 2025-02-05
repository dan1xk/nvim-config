-- ================================
--           Theme Setup
-- ================================

return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Load before other plugins
	config = function()
		require("tokyonight").setup({
			style = "moon", -- Options: "storm", "night", "moon", "day"
			transparent = true, -- Enable transparent background
			terminal_colors = true, -- Use colors in the terminal
			styles = {
				comments = { italic = true },
				keywords = { italic = false },
				functions = { bold = true },
				variables = {},
				sidebars = "transparent", -- Make sidebars transparent
				floats = "dark",
			},
			sidebars = { "qf", "help", "terminal", "packer", "NvimTree" },
			dim_inactive = false, -- Do not dim inactive windows
			lualine_bold = true, -- Use bold text in Lualine
		})

		-- Apply the colorscheme
		vim.cmd([[colorscheme tokyonight]])

		-- Make NvimTree transparent
		vim.cmd([[highlight NvimTreeNormal guibg=NONE ctermbg=NONE]])
	end,
}
