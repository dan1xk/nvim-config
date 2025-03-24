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
				number_style = "superscript",
				mappings = true,
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator_icon = "▎",
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
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
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = "extension",
			},
		})
	end,
}
