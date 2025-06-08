vim.o.number = true
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.o.signcolumn = "yes"
vim.o.mouse = "a"

-- Enable absolute + relative numbers together
vim.opt.number = true
vim.opt.relativenumber = true

-- Toggle relative numbers on mode change
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  callback = function()
    vim.opt.relativenumber = true
  end,
})

