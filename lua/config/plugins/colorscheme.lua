-- ================================
--           Theme Setup
-- ================================

return {
	"blazkowolf/gruber-darker.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruber-darker").setup({
			bold = true,
			invert = {
				signs = false,
				tabline = false,
				visual = false,
			},
			italic = {
				strings = true,
				comments = true,
				operators = false,
				folds = true,
			},
			undercurl = true,
			underline = true,
		})
		vim.cmd("colorscheme gruber-darker")
	end,
}
