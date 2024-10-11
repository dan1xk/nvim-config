-- ================================
--         Gitsigns Setup
-- ================================

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = require("gitsigns")

			-- Function to create key mappings
			local function map(mode, key, action, description)
				vim.keymap.set(mode, key, action, { buffer = bufnr, desc = description })
			end

			-- Navigation Mappings
			map("n", "]h", gs.next_hunk, "Next Hunk") -- Go to the next hunk
			map("n", "[h", gs.prev_hunk, "Prev Hunk") -- Go to the previous hunk

			-- Action Mappings
			map("n", "<leader>hs", gs.stage_hunk, "Stage hunk") -- Stage the current hunk
			map("n", "<leader>hr", gs.reset_hunk, "Reset hunk") -- Reset the current hunk
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) -- Stage selected hunk in visual mode
			end, "Stage hunk")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) -- Reset selected hunk in visual mode
			end, "Reset hunk")

			map("n", "<leader>hS", gs.stage_buffer, "Stage buffer") -- Stage entire buffer
			map("n", "<leader>hR", gs.reset_buffer, "Reset buffer") -- Reset entire buffer
			map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk") -- Undo staging of hunk
			map("n", "<leader>hp", gs.preview_hunk, "Preview hunk") -- Preview the current hunk

			map("n", "<leader>hb", function()
				gs.blame_line({ full = true }) -- Blame the current line
			end, "Blame line")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame") -- Toggle line blame display
			map("n", "<leader>hd", gs.diffthis, "Diff this") -- Diff the current buffer
			map("n", "<leader>hD", function()
				gs.diffthis("~") -- Diff against the last commit
			end, "Diff this ~")

			-- Text Object Mappings
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk") -- Select hunk as a text object
		end,
	},
}

