---------------------------------
-- Floating diagnostics message
---------------------------------
vim.diagnostic.config({
	float = {
		source = "always",
		border = "rounded",
	},
	virtual_text = {
		prefix = '●', -- can be '■', '▎', 'x'
		source = "always", -- or "if_many"
	},
	signs = true,
	underline = true,
	update_in_insert = true, -- update diagnostics in insert mode
	severity_sort = true,
})

local util = require("vim.lsp.util")

local formatting_callback = function(client, bufnr)
	vim.keymap.set("n", "<leader>f", function()
		local params = util.make_formatting_params({})
		client.request("textDocument/formatting", params, nil, bufnr)
	end, { buffer = bufnr })
end

---------------------------------
-- null-ls and ESLint configuration
---------------------------------
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.prettierd,
	},
	on_attach = function(client, buffer)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = buffer,
				callback = function()
					vim.lsp.buf.format({ buffer = buffer })
				end,
			})
		end

		if client.supports_method("textDocument/publishDiagnostics") then
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = buffer,
				callback = function()
					vim.diagnostic.open_float(nil, { focusable = false })
				end,
			})
		end

		formatting_callback(client, buffer)
	end,
})

---------------------------------
-- Customize diagnostic signs
---------------------------------
local signs = {
	Error = "✖",
	Warn = "⚠",
	Hint = "➤",
	Info = "ℹ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
