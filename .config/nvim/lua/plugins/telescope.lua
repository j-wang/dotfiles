  -- Telescope setup
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup{
        defaults = {
          -- use ripgrep’s smart-case
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob", "!.git/*",   -- ignore everything in `.git/`
          },
          file_ignore_patterns = {
            "node_modules",
          },
        },
        pickers = {
          live_grep = {
            -- add these so live_grep will also search dotfiles but still respect .gitignore:
            additional_args = function(opts)
              return { 
                "--hidden",
                "--glob", "!.git/*",             -- ignore .git/
                "--glob", "!**/node_modules/*",  -- ignore anything under node_modules
              }
            end,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter    = true,
            case_mode = "smart_case",
          },
        },
      }
      -- load extensions after setup
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('project')
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
