-- ================================
--         Treesitter Plugin
-- ================================

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" }, -- Load on buffer read or new file
	build = ":TSUpdate", -- Command to run for updating treesitter parsers
	dependencies = {
	  "windwp/nvim-ts-autotag", -- Autotagging for HTML-like files
	},
  
	config = function()
	  -- Import the nvim-treesitter plugin
	  local treesitter = require("nvim-treesitter.configs")
  
	  -- Configure treesitter
	  treesitter.setup({
		highlight = {
		  enable = true, -- Enable syntax highlighting
		},
		indent = {
		  enable = true, -- Enable indentation
		},
		autotag = {
		  enable = true, -- Enable autotagging
		},
		ensure_installed = {
		  "json",
		  "javascript",
		  "typescript",
		  "tsx",
		  "yaml",
		  "html",
		  "css",
		  "prisma",
		  "markdown",
		  "markdown_inline",
		  "svelte",
		  "graphql",
		  "bash",
		  "lua",
		  "vim",
		  "dockerfile",
		  "gitignore",
		  "query",
		  "vimdoc",
		  "c", -- Ensure these language parsers are installed
		},
		incremental_selection = {
		  enable = true, -- Enable incremental selection
		  keymaps = {
			init_selection = "<C-space>",  -- Keymap for initial selection
			node_incremental = "<C-space>", -- Keymap for node increment
			scope_incremental = false,       -- Disable scope increment
			node_decremental = "<bs>",       -- Keymap for node decrement
		  },
		},
	  })
	end,
  }
  