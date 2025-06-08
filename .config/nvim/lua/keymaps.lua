local builtin = require('telescope.builtin')

-- Quick file navigation
vim.keymap.set('n', '<leader>ff', function() 
	require('telescope.builtin').find_files({ hidden = true }) end)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles)

-- Project Management (press c in a git directory to add)
vim.keymap.set('n', '<leader>fp', function()
  require('telescope').extensions.project.project()
end, { desc = "Switch Project" })

-- Window splits
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })

-- Resize splits with arrow keys + Ctrl
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Back to the file explorer
vim.keymap.set("n", "<leader>e", function()
  require("oil").open()
end, { desc = "Open Oil (file explorer)" })

-- Open the quickfix window
vim.keymap.set('n', '<leader>qq', function()
  vim.cmd('copen')
end, {})

-- Reload the nvim config
vim.keymap.set("n", "<leader>R", function()
  for name,_ in pairs(package.loaded) do
    if name:match("^keymaps") or name:match("^plugins") or name:match("^settings") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Full config reloaded", vim.log.levels.INFO)
end, { desc = "Hot reload full config" })
