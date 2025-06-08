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
  {
    "mason-org/mason.nvim",
    version = ">=2.0.0", -- ensure you get the new major version
    opts = {},           -- optional Mason setup
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = ">=2.0.0", -- ensures >=v2.x to support ts_ls, handlers, etc.
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ts_ls", "gopls" }
    },
  },
  -- Trouble.nvim
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "+" },
          change       = { text = "~" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
        signcolumn = true,  -- Show git signs in the gutter
        numhl      = false,
        linehl     = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
      })
    end,
  },
  -- Icons, already required but more specific
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- icons
      "MunifTanjim/nui.nvim",        -- UI lib
      "s1n7ax/nvim-window-picker",   -- optional, but nice
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "left",
          width = 30,
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
    end
  },
  "nvim-treesitter/nvim-treesitter",
  "hrsh7th/nvim-cmp",
  "neovim/nvim-lspconfig",
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

