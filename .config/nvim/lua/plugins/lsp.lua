return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Common on_attach function for all LSPs
    local function on_attach(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- Keymaps
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
        vim.tbl_extend('force', bufopts, { desc = '(LSP) Go to definition' }))
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
        vim.tbl_extend('force', bufopts, { desc = '(LSP) Go to declaration' }))
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
        vim.tbl_extend('force', bufopts, { desc = '(LSP) Go to implementation' }))
      vim.keymap.set('n', 'gr', vim.lsp.buf.references,
        vim.tbl_extend('force', bufopts, { desc = '(LSP) Go to references' }))
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
        vim.tbl_extend('force', bufopts, { desc = '(LSP) Rename symbol' }))
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
        vim.tbl_extend('force', bufopts, { desc = '(LSP) Code action' }))
      vim.keymap.set('n', 'K', vim.lsp.buf.hover,
        vim.tbl_extend('force', bufopts, { desc = '(LSP) Hover documentation' }))

      -- Format on save for specific filetypes
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end

      -- If this is ts_ls, disable its formatting; we'll let null-ls handle via prettierd
      if client.name == 'ts_ls' then
        client.server_capabilities.documentFormattingProvider = false
      end
    end

    -- Capabilities for nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- TypeScript/JavaScript
    lspconfig.ts_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- Python
    lspconfig.pyright.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- Go
    lspconfig.gopls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
        },
      },
    }

    -- Lua
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,
}

