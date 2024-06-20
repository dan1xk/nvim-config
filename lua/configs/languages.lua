
---------------------------------
local lspconfig = require("lspconfig")
local caps = vim.lsp.protocol.make_client_capabilities()
local no_format = function(client, bufnr)
	client.server_capabilities.document_formatting = false
end

-- Capabilities
caps.textDocument.completion.completionItem.snippetSupport = true

-- Python
lspconfig.pyright.setup({ capabilities = caps, on_attach = no_format })

-- JavaScript/Typescript
lspconfig.tsserver.setup({ capabilities = caps, on_attach = no_format })

-- Tailwind CSS
lspconfig.tailwindcss.setup({
	capabilities = caps,
	on_attach = no_format,
})


-- Emmet -> div>ul>li*3
lspconfig.emmet_ls.setup({
	capabilities = snip_caps,
	filetypes = {
		"css",
		"html",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"typescriptreact",
	},
})
