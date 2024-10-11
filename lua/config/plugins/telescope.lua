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
		local trouble_telescope = require("trouble.providers.telescope")

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
		}

		telescope.setup({
			defaults = {
				path_display = { "smart" }, -- Smart path display
				file_ignore_patterns = ignore_filetypes_list, -- Patterns to ignore in file searches
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- Move to previous result
						["<C-j>"] = actions.move_selection_next, -- Move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist, -- Send to quickfix and open trouble
						["<C-t>"] = trouble_telescope.smart_open_with_trouble, -- Open with trouble
					},
				},
			},
		})

		telescope.load_extension("fzf") -- Load the fzf extension

		-- Set keymaps for telescope commands
		local keymap = vim.keymap -- For conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}

