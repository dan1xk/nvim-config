-- ================================
--         Autopairs Configuration
-- ================================

return {
  "windwp/nvim-autopairs",                 
  event = "InsertEnter" ,               
  dependencies = {
    "hrsh7th/nvim-cmp",                    
  },
  config = function()
    local autopairs = require("nvim-autopairs")

    -- Configure autopairs
    autopairs.setup({
      check_ts = true,                       -- Enable Treesitter integration
      ts_config = {
        lua = { "string" },                  -- Don't add pairs in Lua string nodes
        javascript = { "template_string" },  -- Don't add pairs in JavaScript template string nodes
        java = false,                        -- Don't check Treesitter on Java
      },
    })

    -- Import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- Import nvim-cmp (completion plugin)
    local cmp = require("cmp")

    -- Integrate autopairs with completion
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
