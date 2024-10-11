-- ================================
--           Theme Setup
-- ================================

return {
	"ellisonleao/gruvbox.nvim", -- Gruvbox colorscheme plugin
	config = function()
		-- Setup Gruvbox with specified options
		require("gruvbox").setup({
			-- General settings
			undercurl = true, -- Enable undercurl
			underline = false, -- Disable underlining
			bold = true, -- Enable bold text
			strikethrough = true, -- Enable strikethrough
			invert_selection = false, -- Disable selection inversion
			invert_signs = false, -- Disable sign inversion
			invert_tabline = false, -- Disable tabline inversion
			transparent_mode = true, -- Enable transparent mode
			dim_inactive = false, -- Don't dim inactive windows

			-- Contrast and appearance
			contrast = "", -- Options: "hard", "soft", or empty
			palette_overrides = {}, -- Custom palette overrides
			overrides = {
				CursorLine = { bg = "#1c3836" }, -- Background for the current line
				CursorLineNr = { fg = "#fabd2f", bg = "#1c3836", bold = true }, -- Line number styling
			},
		})

		-- Set the colorscheme to gruvbox
		vim.cmd("colorscheme gruvbox")
	end,
}

