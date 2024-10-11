-- ================================
--   Formatting (Conformn setup)
-- ================================

return {
	"stevearc/conform.nvim", --
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		-- Setup conform with specified formatters
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" }, -- Format JavaScript files with Prettier
				typescript = { "prettier" }, -- Format TypeScript files with Prettier
				javascriptreact = { "prettier" }, -- Format React files with Prettier
				typescriptreact = { "prettier" }, -- Format TypeScript React files with Prettier
				svelte = { "prettier" }, -- Format Svelte files with Prettier
				css = { "prettier" }, -- Format CSS files with Prettier
				html = { "prettier" }, -- Format HTML files with Prettier
				json = { "prettier" }, -- Format JSON files with Prettier
				yaml = { "prettier" }, -- Format YAML files with Prettier
				markdown = { "prettier" }, -- Format Markdown files with Prettier
				graphql = { "prettier" }, -- Format GraphQL files with Prettier
				liquid = { "prettier" }, -- Format Liquid files with Prettier
				lua = { "stylua" }, -- Format Lua files with Stylua
				python = { "isort", "black" }, -- Format Python files with isort and Black
			},
			format_on_save = {
				lsp_fallback = true, -- Use LSP formatter if available
				async = false, -- Run formatting synchronously
				timeout_ms = 1000, -- Timeout for formatting in milliseconds
			},
		})

		-- Key mapping for formatting
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" }) -- Description for the key mapping
	end,
}

