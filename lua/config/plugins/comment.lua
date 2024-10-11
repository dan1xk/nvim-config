-- ================================
--          Comment.nvim Setup
-- ================================

return {
	"numToStr/Comment.nvim",                            
	event = { "BufReadPre", "BufNewFile" },            
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" }, 
	config = function()
	  -- Import the comment plugin safely
	  local comment = require("Comment")
	  local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
  
	  -- Setup the comment plugin with context-aware comments
	  comment.setup({
		pre_hook = ts_context_commentstring.create_pre_hook(), -- Pre-hook for context-aware comments
	  })
	end,
  }
  