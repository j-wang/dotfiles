return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      on_attach = function(client, bufnr)
        -- Manual format keybind
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end, { noremap = true, silent = true, buffer = bufnr, desc = 'Format buffer' })
      end,

      sources = {
        -- JavaScript / TypeScript
        formatting.prettierd.with({
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "css", "scss", "json", "yaml", "markdown" },
        }),

        -- Go
        formatting.goimports,
      },
    })
  end,
}