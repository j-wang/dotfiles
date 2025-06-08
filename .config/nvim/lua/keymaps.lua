local builtin = require('telescope.builtin')

-- Set leader key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

-- Window splits
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })

-- Resize splits with arrow keys + Ctrl
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Back to the file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "File Explorer (netrw)" })

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
