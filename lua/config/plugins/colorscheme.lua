-- ================================
--           Theme Setup
-- ================================

return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = false,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true,
			contrast = "",
			palette_overrides = {},
			dim_inactive = false,
			transparent_mode = true,
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
