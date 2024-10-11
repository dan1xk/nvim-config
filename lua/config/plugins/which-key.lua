-- ================================
--        Which-Key Plugin
-- ================================

return {
  "folke/which-key.nvim",       
  event = "VeryLazy",           -- Load the plugin on a very lazy event
  init = function()
    vim.o.timeout = true        -- Enable timeout for key mappings
    vim.o.timeoutlen = 500      -- Set timeout length to 500ms
  end,
  opts = {
    -- Your configuration comes here
    -- Or leave it empty to use the default settings
    -- Refer to the configuration section below
  },
}
