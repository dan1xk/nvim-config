-- ================================
--         Linting Plugin
-- ================================

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
	  local lint = require("lint")
  
	  -- Define linters based on file types
	  lint.linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		svelte = { "eslint_d" },
		python = { "pylint" },
	  }
  
	  -- Create an augroup for linting
	  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  
	  -- Autocommand to trigger linting on specific events
	  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
		  lint.try_lint()
		end,
	  })
  
	  -- Key mapping to manually trigger linting
	  vim.keymap.set("n", "<leader>l", function()
		lint.try_lint()
	  end, { desc = "Trigger linting for current file" })
	end,
  }
  