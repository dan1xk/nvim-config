-- ================================
--         Mason Configuration
-- ================================

return {
  "williamboman/mason.nvim",             
  dependencies = {
    "williamboman/mason-lspconfig.nvim",      -- LSP configuration for Mason
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- Tool installer for Mason
  },
  config = function()
    -- Import necessary modules
    local mason = require("mason")                              -- Import Mason
    local mason_lspconfig = require("mason-lspconfig")          -- Import Mason LSP configuration
    local mason_tool_installer = require("mason-tool-installer") -- Import Mason tool installer

    -- Enable Mason and configure UI icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",    -- Icon for installed packages
          package_pending = "➜",      -- Icon for pending installations
          package_uninstalled = "✗",  -- Icon for uninstalled packages
        },
      },
    })

    -- Configure Mason LSP settings
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",      -- TypeScript server
        "html",          -- HTML server
        "cssls",        -- CSS server
        "tailwindcss",   -- Tailwind CSS server
        "svelte",        -- Svelte server
        "lua_ls",        -- Lua language server
        "graphql",       -- GraphQL server
        "emmet_ls",      -- Emmet server
        "prismals",      -- Prisma language server
        "pyright",       -- Python server
      },
    })

    -- Configure Mason tool installer settings
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",   -- Prettier formatter
        "stylua",     -- Lua formatter
        "isort",      -- Python import sorter
        "black",      -- Python formatter
        "pylint",     -- Python linter
        "eslint_d",   -- ESLint daemon for JavaScript and TypeScript
      },
    })
  end,
}
