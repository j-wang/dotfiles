-- Indentation settings per filetype

local function set_indent(filetypes, size, expand)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
      vim.opt_local.tabstop = size
      vim.opt_local.shiftwidth = size
      vim.opt_local.softtabstop = size
      vim.opt_local.expandtab = expand
    end,
  })
end

-- 2-space indents
set_indent({ "lua", "javascript", "typescript", "json", "yaml" }, 2, true)

-- 4-space indents
set_indent({ "python", "rust", "c", "cpp", "java" }, 4, true)

-- Go: use tabs (rendered as 8 spaces)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.softtabstop = 8
    vim.opt_local.expandtab = false
  end,
})

