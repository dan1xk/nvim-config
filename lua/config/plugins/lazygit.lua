-- ================================
--         LazyGit Plugin
-- ================================

return {
  "kdheepak/lazygit.nvim",
  -- Commands provided by LazyGit
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  
  -- Optional dependency for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  
  -- Recommended keybinding for LazyGit
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  },
}
