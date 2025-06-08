-- Plugin manager bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy.vim Setup
require("lazy").setup({
  -- Telescope setup
  { "nvim-telescope/telescope.nvim", 
          dependencies = { "nvim-lua/plenary.nvim" } 
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make",
	  config = function() require('telescope').load_extension('fzf') end,
  },
  { "nvim-telescope/telescope-project.nvim",
	  dependencies = { "nvim-telescope/telescope.nvim" },
	  config = function()
		  require("telescope").load_extension("project") end,
  },
  -- Oil.nvim File Explorer
  { "stevearc/oil.nvim", opts = { 
		  default_file_explorer = true,
		  skip_confirm_for_simple_edits = true,
		  delete_to_trash = true,
		  view_options = { show_hidden = true, },
	  },
	  dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- Theming
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  -- Mason for handling LSPs
  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "tsserver", "gopls" },
      })
  
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
  
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
  "nvim-treesitter/nvim-treesitter",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "nvim-lualine/lualine.nvim",
  "lewis6991/gitsigns.nvim",
})

-- Telescope configuration
require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    file_ignore_patterns = { "node_modules", "%.git/", "%.cache" },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    }
  },
  extensions = {
    project = {
      hidden_files = true,
      theme = "dropdown",
      order_by = "recent",
      search_by = "title",
      sync_with_nvim_tree = true,
    }
  }
})
