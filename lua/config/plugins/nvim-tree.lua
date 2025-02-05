-- ================================
--         nvim-tree Plugin
-- ================================

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons", -- Dependency for file icons
	config = function()
		local nvimtree = require("nvim-tree")

		-- Recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			update_focused_file = { -- Focus on the open file
				enable = true,
				update_cwd = false,
				ignore_list = {},
			},
			view = {
				width = 40,
			},
			filesystem_watchers = {
				ignore_dirs = {
					"node_modules",
					".git",
					".cache",
				},
			},
			diagnostics = {
				enable = true, -- Enable diagnostics
				show_on_dirs = false, -- Show diagnostics on directories
				show_on_open_dirs = true, -- Show diagnostics on opened directories
				debounce_delay = 200, -- Debounce delay for diagnostics
				severity = {
					min = vim.diagnostic.severity.HINT, -- Minimum severity level
					max = vim.diagnostic.severity.ERROR, -- Maximum severity level
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false, -- Disable window picker for splits
					},
				},
			},
			filters = {
				custom = { ".DS_Store" }, -- Custom filters
				git_ignored = false, -- Don't ignore git files
			},
		})

		-- Set keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		)
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}
