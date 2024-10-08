return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = false,
			bold = true,
			-- italic = {
			-- 	strings = true,
			-- 	emphasis = true,
			-- 	comments = true,
			-- 	operators = false,
			-- 	folds = true,
			-- },
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			dim_inactive = false,
			overrides = {
				CursorLine = { bg = "#1c3836" }, -- change the background color of the current line
				CursorLineNr = { fg = "#fabd2f", bg = "#1c3836", bold = true }, -- change the color of the line number
			},
			transparent_mode = true,
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
