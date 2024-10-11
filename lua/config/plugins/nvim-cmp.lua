-- ================================
--         nvim-cmp Plugin
-- ================================

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
	  "hrsh7th/cmp-buffer",       -- Source for text in buffer
	  "hrsh7th/cmp-path",         -- Source for file system paths
	  {
		"L3MON4D3/LuaSnip",
		version = "v2.*",         -- Follow the latest release
		build = "make install_jsregexp", -- Optional build for JS regex
	  },
	  "saadparwaiz1/cmp_luasnip", -- For autocompletion with LuaSnip
	  "rafamadriz/friendly-snippets", -- Useful snippets
	  "onsails/lspkind.nvim",     -- VS Code-like pictograms
	},
	
	config = function()
	  local cmp = require("cmp")
	  local luasnip = require("luasnip")
	  local lspkind = require("lspkind")
  
	  -- Load VSCode style snippets from installed plugins
	  require("luasnip.loaders.from_vscode").lazy_load()
  
	  -- nvim-cmp setup
	  cmp.setup({
		completion = {
		  completeopt = "menu,menuone,preview,noselect", -- Options for completion menu
		},
		snippet = {
		  expand = function(args)
			luasnip.lsp_expand(args.body) -- Expand snippets
		  end,
		},
		mapping = cmp.mapping.preset.insert({
		  ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
		  ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
		  ["<C-b>"] = cmp.mapping.scroll_docs(-4),    -- Scroll docs up
		  ["<C-f>"] = cmp.mapping.scroll_docs(4),     -- Scroll docs down
		  ["<C-x>"] = cmp.mapping.complete(),           -- Show completion suggestions
		  ["<C-e>"] = cmp.mapping.abort(),              -- Close completion window
		  ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection
		}),
		sources = cmp.config.sources({
		  { name = "nvim_lsp" },     -- LSP source
		  { name = "luasnip" },      -- Snippet source
		  { name = "buffer" },       -- Buffer source
		  { name = "path" },         -- File system paths
		}),
		formatting = {
		  format = lspkind.cmp_format({
			maxwidth = 50,           -- Maximum width for the item
			ellipsis_char = "...",   -- Character for ellipsis
		  }),
		},
	  })
	end,
  }
  