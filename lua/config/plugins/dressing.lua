-- ================================
--          Dressing.nvim Setup
-- ================================

return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	config = function()
		require("dressing").setup({
			input = {
				default_prompt = "Input:",
			},
			select = {
				backend = { "telescope", "fzf", "builtin" },
				builtin = {
					win_options = { winhighlight = "Normal:Normal" },
				},
			},
		})
	end,
}
