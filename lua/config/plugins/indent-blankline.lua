-- ================================
--      Indent Blankline Setup
-- ================================

return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl", -- Main module to load
	opts = {
		indent = {
			char = "┊", -- Character used for indentation lines
		},
	},
}
