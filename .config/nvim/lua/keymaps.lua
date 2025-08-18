-- Quick file navigation
vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files({ hidden = true })
end, { desc = "Files Find Files" })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "Files Live Grep" })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = "Files Buffer" })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = "Files Old List" })

-- Discovery
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").keymaps, { desc = "Find keymap" })

-- Project Management (press c in a git directory to add)
vim.keymap.set('n', '<leader>fp', function()
  require('telescope').extensions.project.project()
end, { desc = "Switch Project" })

-- Window splits
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Window Horizontal Split" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Window Vertical Split" })

-- Resize splits with arrow keys + Ctrl
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Window Split Resize" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Window Split Resize" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Window Split Resize" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Window Split Resize" })

-- Back to the file explorer
vim.keymap.set("n", "<leader>e", function()
  require("oil").open_float()
end, { desc = "Open Oil (file explorer)" })

-- Show Neotree side tree
vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle<CR>",
  { desc = "Toggle file tree" })

-- Show diagnostic
vim.keymap.set("n", "<leader>d",
  vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Open the quickfix window
vim.keymap.set('n', '<leader>qq', function()
  vim.cmd('copen')
end, { desc = "Open quickfix window" })

vim.keymap.set("n", "<leader>gb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle Git Blame" })

-- Reload the nvim config
vim.keymap.set("n", "<leader>R", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^keymaps") or name:match("^plugins") or name:match("^settings") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Full config reloaded", vim.log.levels.INFO)
end, { desc = "Hot reload full config" })
