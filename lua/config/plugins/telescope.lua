-- ================================
--         Telescope Plugin
-- ================================

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod
		local trouble = require("trouble")
		local custom_actions = transform_mod({
			open_trouble_qflist = function()
				trouble.toggle("quickfix")
			end,
		})
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
				path_display = { "smart" },
				file_ignore_patterns = ignore_filetypes_list,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = require("trouble.sources.telescope").open,
					},
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
