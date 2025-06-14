  -- Mason for handling LSPs
return {
  {
    "mason-org/mason.nvim",
    version = ">=2.0.0", -- ensure you get the new major version
    opts = {},           -- optional Mason setup
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = ">=2.0.0", -- ensures >=v2.x to support ts_ls, handlers, etc.
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ts_ls", "gopls" },
    },
  }
}
