-- Set leader key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins")
require("settings")
require("keymaps")
require("ui")

-- Block that has requirements for loaded packages
require("lspconfig")

-- Enter Telescope if no file is passed
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("telescope.builtin").find_files({ hidden = true })
    end
  end,
})
