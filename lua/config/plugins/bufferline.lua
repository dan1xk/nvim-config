-- ================================
--        Bufferline Configuration
-- ================================

return {
	"akinsho/nvim-bufferline.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none",
				mappings = true,
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				indicator_icon = "▎",
				modified_icon = "●",
				max_name_length = 18,
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count)
					return "(" .. count .. ")"
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
					},
				},
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				separator_style = "thin",
				always_show_bufferline = false,
				sort_by = "extension",
			},
		})
	end,
}
