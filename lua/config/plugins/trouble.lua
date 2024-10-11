-- ================================
--         Trouble Plugin
-- ================================

return {
	"folke/trouble.nvim", -- Plugin for displaying diagnostics and other lists
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" }, -- Required dependencies
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" }, -- Toggle the trouble list
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" }, -- Show workspace diagnostics
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" }, -- Show document diagnostics
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" }, -- Show quickfix list
		{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" }, -- Show location list
		{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" }, -- Show todos in trouble
	},
}
