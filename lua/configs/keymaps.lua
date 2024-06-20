---------------------------------
-- Key bindings
---------------------------------
local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

---------------------------------
-- Leader
---------------------------------
vim.g.mapleader = "<space>"

---------------------------------
-- Vim
---------------------------------
kmap("n", "<C-p>", ':lua require("telescope.builtin").find_files()<CR>', opts)
kmap("n", "<C-q>", ":q!<CR>", opts)
kmap("n", "<F12>", ":TSHighlightCapturesUnderCursor<CR>", opts)
kmap("n", "<F4>", ":bd<CR>", opts)
kmap("n", "<space>e", ":Neotree toggle<CR>", opts)
kmap("n", "<F6>", ":sp<CR>:terminal<CR>", opts)
kmap("n", "<S-Tab>", "gT", opts)
kmap("n", "<Tab>", "gt", opts)
kmap("n", "<silent> <Tab>", ":tabnew<CR>", opts)
kmap("n", "<space>f", ':lua require("telescope.builtin").find_files()<CR>', opts)

---------------------------------
-- Utils
---------------------------------
kmap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
kmap("n", "<space>D", vim.lsp.buf.type_definition, opts)
kmap("n", "<space>ca", vim.lsp.buf.code_action, opts)
kmap("n", "<space>rn", vim.lsp.buf.rename, opts)
kmap("n", "K", vim.lsp.buf.hover, opts)
kmap("n", "gD", vim.lsp.buf.declaration, opts)
kmap("n", "gd", vim.lsp.buf.definition, opts)
kmap("n", "gi", vim.lsp.buf.implementation, opts)
kmap("n", "gr", vim.lsp.buf.references, opts)

-- Save file with Ctrl+S
kmap("n", "<C-s>", ":w<CR>", opts)
kmap("i", "<C-s>", "<Esc>:w<CR>a", opts)
kmap("v", "<C-s>", "<Esc>:w<CR>gv", opts)

---------------------------------
-- Diagnostics
---------------------------------
-- kmap("n", "<space>e", vim.diagnostic.open_float, opts)
kmap("n", "<space>q", vim.diagnostic.setloclist, opts)
kmap("n", "[d", vim.diagnostic.goto_prev, opts)
kmap("n", "]d", vim.diagnostic.goto_next, opts)

---------------------------------
-- Auto commands
---------------------------------
vim.cmd([[ autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync() ]])
vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.cmd([[ autocmd FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 colorcolumn=120]])
