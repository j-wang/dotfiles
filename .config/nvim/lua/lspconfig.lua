-- Lua configuration
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
	globals = { "vim" },  -- ignore vim global
      },
    }
  }
})

