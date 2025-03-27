-- ================================
--         Linting Plugin
-- ================================

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local function has_eslint_config()
			local eslintrc_files = {
				".eslintrc",
				".eslintrc.json",
				".eslintrc.js",
				".eslintrc.yaml",
				".eslintrc.yml",
			}
			for _, file in ipairs(eslintrc_files) do
				if vim.fn.glob(file) ~= "" then
					return true
				end
			end

			return false
		end
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if has_eslint_config() then
					lint.try_lint()
				end
			end,
		})
	end,
}
