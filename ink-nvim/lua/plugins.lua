-- ignore
require("lazy").setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
    end,
  },
  "folke/tokyonight.nvim",

  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            prompt_position = "top",
          },
          file_ignore_patterns = { "node_modules", ".git" },
        },
        pickers = {
          live_grep = {
            hidden = true,
          },
        },
      })
    end,
  },

  "neovim/nvim-lspconfig",

  {
    "mhartington/formatter.nvim",
    config = function()
      -- Utilities for creating configurations
      local util = require("formatter.util")

      -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
      require("formatter").setup({
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
          -- Formatter configurations for filetype "lua" go here
          -- and will be executed in order
          go = {
            require("formatter.filetypes.go").gofmt,
          },
          lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,
          },
          javascript = {
            -- prettierd
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          typescript = {
            -- prettierd
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          nix = {
            -- nixfmt
            function()
              return {
                exe = "nixfmt",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          rust = {
            -- rustfmt
            function()
              return {
                exe = "rustfmt",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          -- Use the special "*" filetype for defining formatter configurations on
          -- any filetype
          ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
          "tsx",
          "typescript",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",

  {
    "lukas-reineke/indent-blankline.nvim",

    config = function()
      require("ibl").setup()
    end,
  },

  "nvim-tree/nvim-web-devicons",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
        },
      })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.completion.spell,
        },
      })
    end,
  },
  {
    "f-person/git-blame.nvim",
  },
  {
    "firesquid6/nvim-yati",
    config = function()
      require("nvim-treesitter.configs").setup({
        yati = {
          enable = true,
          disable = { "gdscript", "go", "lua", "json", "cpp", },
          -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
          default_lazy = true,
          -- Determine the fallback method used when we cannot calculate indent by tree-sitter
          --   "auto": fallback to vim auto indent
          --   "asis": use current indent as-is
          --   "cindent": see `:h cindent()`
          -- Or a custom function return the final indent result.
          default_fallback = "auto",
          suppress_conflict_warning = false,
        },
        indent = {
          enable = true, -- disable builtin indent module
          disable = { "html", "javascript", "typescript", "tsx", "python" },
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup()
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv " } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "davidmh/mdx.nvim",
    config = true,
  }
})
