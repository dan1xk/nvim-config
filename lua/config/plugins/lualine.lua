-- ================================
--         Lualine Plugin
-- ================================

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- To configure lazy pending updates count
		-- Lualine setup
		lualine.setup({
			options = {
				theme = "tokyonight", -- Set the desired theme
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates, -- Display the count of lazy updates
						cond = lazy_status.has_updates, -- Only show if there are updates
						color = { fg = "#ff9e64" }, -- Set the color of the updates section
					},
					{ "encoding" }, -- Display the file encoding
					{ "fileformat" }, -- Display the file format
					{ "filetype" }, -- Display the file type
				},
			},
		})
	end,
}
