-- ================================
--         Telescope Plugin
-- ================================

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Lua functions for many plugins
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FZF integration
		"nvim-tree/nvim-web-devicons", -- File icons
		"folke/todo-comments.nvim", -- Todo comments
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")

		-- Custom action to open trouble's quickfix list
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		-- List of file patterns to ignore
		local ignore_filetypes_list = {
			"./node_modules/*",
			"node_modules",
			"venv",
			"__pycache__",
			"%.xlsx",
			"%.jpg",
			"%.png",
			"%.webp",
			"%.pdf",
			"%.odt",
			"%.ico",
			"%.exe",
			"package%-lock.json",
			"yarn%-error.log",
			"yarn.lock",
		}

		telescope.setup({
			defaults = {
				winblend = 30,
				path_display = { "smart" }, -- Smart path display
				file_ignore_patterns = ignore_filetypes_list, -- Patterns to ignore in file searches
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- Move to previous result
						["<C-j>"] = actions.move_selection_next, -- Move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist, -- Send to quickfix and open trouble
						["<C-t>"] = require("trouble.sources.telescope").open,
						-- Open with trouble
					},
				},
			},
		})

		telescope.load_extension("fzf") -- Load the fzf extension
	end,
}
