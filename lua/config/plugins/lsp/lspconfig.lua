-- ================================
--      LSP Configuration
-- ================================

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Completion source for LSP
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- File operations
		{ "folke/neodev.nvim", opts = {} }, -- Neovim development enhancements
	},
	config = function()
		-- Import necessary plugins
		local lspconfig = require("lspconfig") -- LSP configuration
		local mason_lspconfig = require("mason-lspconfig") -- Mason for LSP management
		local cmp_nvim_lsp = require("cmp_nvim_lsp") -- Nvim-cmp source for LSP

		local keymap = vim.keymap -- For conciseness

		-- LSP Attach Autocommand
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings
				local opts = { buffer = ev.buf, silent = true }

				-- Set keybinds for LSP functionalities
				keymap.set(
					"n",
					"gR",
					"<cmd>Telescope lsp_references<CR>",
					{ desc = "Show LSP references", unpack(opts) }
				)
				keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", unpack(opts) })
				keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					{ desc = "Show LSP definitions", unpack(opts) }
				)
				keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					{ desc = "Show LSP implementations", unpack(opts) }
				)
				keymap.set(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					{ desc = "Show LSP type definitions", unpack(opts) }
				)
				keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "See available code actions", unpack(opts) }
				)
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", unpack(opts) })
				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					{ desc = "Show buffer diagnostics", unpack(opts) }
				)
				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					{ desc = "Show line diagnostics", unpack(opts) }
				)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", unpack(opts) })
				keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", unpack(opts) })
				keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for cursor", unpack(opts) })
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", unpack(opts) })
			end,
		})

		-- Enable autocompletion capabilities
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change Diagnostic symbols in the sign column
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Mason LSP Setup Handlers
		mason_lspconfig.setup_handlers({
			-- Default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({ capabilities = capabilities })
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" }, -- Recognize "vim" global
							},
							completion = {
								callSnippet = "Replace", -- Snippet behavior
							},
						},
					},
				})
			end,
		})
	end,
}
