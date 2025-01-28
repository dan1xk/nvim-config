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
			palette_overrides = {
				illuminated_bg = "#3c3836",
				dark0_hard = "#1d2021",
			}, -- Custom palette overrides
		})

		-- Set the colorscheme to gruvbox
		vim.cmd("colorscheme gruvbox")
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3c3836" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3c3836" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3c3836" })
	end,
}
