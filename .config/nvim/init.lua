require("plugins")
require("settings")
require("keymaps")

-- Enter Telescope if no file is passed
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("telescope.builtin").find_files()
    end
  end,
})
