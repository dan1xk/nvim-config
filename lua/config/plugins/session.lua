-- ================================
--        Session  Plugin
-- ================================

return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<Leader>sf", require("auto-session.session-lens").search_session, {
			desc = "Open find sessions",
			noremap = true,
		})
		keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last
		keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace
	end,
}
