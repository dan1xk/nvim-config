-- ================================
--          Dressing.nvim Setup
-- ================================

return {
  "stevearc/dressing.nvim",                                 
  event = "VeryLazy",                                       
  config = function()
    require("dressing").setup({
      input = {
        default_prompt = "Input:",                          -- Default prompt for input dialogs
      },
      select = {
        backend = { "telescope", "fzf", "builtin" },        -- Options for selection
        builtin = {
          win_options = { winhighlight = "Normal:Normal" }, -- Customize built-in select window
        },
      },
    })
  end,
}
