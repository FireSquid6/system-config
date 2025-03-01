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
  "mfussenegger/nvim-lint",

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

  {
    "tpope/vim-surround",
    event = "InsertEnter",
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = true,
  --         auto_refresh = false,
  --         keymap = {
  --           jump_prev = "[[",
  --           jump_next = "]]",
  --           accept = "<CR>",
  --           refresh = "gr",
  --           open = "<M-CR>",
  --         },
  --         layout = {
  --           position = "bottom", -- | top | left | right
  --           ratio = 0.4,
  --         },
  --       },
  --       suggestion = {
  --         enabled = false,
  --         auto_trigger = true,
  --         debounce = 75,
  --         keymap = {
  --           accept = "<C-l>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>",
  --         },
  --       },
  --       filetypes = {
  --         yaml = false,
  --         markdown = false,
  --         help = false,
  --         norg = false,
  --         gitcommit = false,
  --         gitrebase = false,
  --         hgcommit = false,
  --         svn = false,
  --         cvs = false,
  --         ["."] = false,
  --       },
  --       copilot_node_command = "node", -- Node.js version must be > 16.x
  --       server_opts_overrides = {},
  --     })
  --   end,
  -- },
  -- {
  --   "Exafunction/codeium.nvim",
  --
  --   config = function()
  --     require("codeium").setup({
  --       enable_chat = true,
  --     })
  --   end,
  -- },
  "nvim-tree/nvim-web-devicons",
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
  -- {
  --   "startup-nvim/startup.nvim",
  --   config = function()
  --     require("startup").setup({
  --       theme = "evil",
  --     })
  --   end,
  -- },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup()
    end,
    event = "VeryLazy",
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
  -- {
  -- 	"nvim-neo-tree/neo-tree.nvim",
  -- 	branch = "v3.x",
  -- 	dependencies = {
  -- 		"nvim-lua/plenary.nvim",
  -- 		"nvim-tree/nvim-web-devicons",
  -- 		"MunifTanjim/nui.nvim",
  -- 	},
  -- },
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
    "echasnovski/mini.icons",
  },
  {
    "hadronized/hop.nvim",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "ibhagwan/fzf-lua",
  },
  -- {
  --   "frankroeder/parrot.nvim",
  --   dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  --   tag = "v1.2.1",
  --   config = function()
  --     require("parrot").setup({
  --       providers = {
  --         anthropic = {
  --           api_key = os.getenv("ANTHROPIC_API_KEY")
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    tag = "v0.0.14",
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
      {
        "jakewvincent/mkdnflow.nvim",
        config = function()
          require("mkdnflow").setup({
            links = {
              style = 'markdown',
              name_is_source = false,
              conceal = false,
              context = 0,
              implicit_extension = nil,
              transform_implicit = false,
              transform_explicit = function(text)
                text = text:gsub(" ", "-")
                text = text:lower()
                text = os.date('%Y-%m-%d_') .. text
                return (text)
              end,
              create_on_follow_failure = true
            },
            new_file_template = {
              use_template = false,
              placeholders = {
                before = {
                  title = "link_title",
                  date = "os_date"
                },
                after = {}
              },
              template = "# {{ title }}"
            },
            to_do = {
              symbols = { ' ', '-', 'X' },
              update_parents = true,
              not_started = ' ',
              in_progress = '-',
              complete = 'X'
            },
            mappings = {
              MkdnEnter = { { 'n', 'v' }, '<CR>' },
              MkdnTab = false,
              MkdnSTab = false,
              MkdnNextLink = false,
              MkdnPrevLink = false,
              MkdnNextHeading = false,
              MkdnPrevHeading = false,
              MkdnGoBack = false,
              MkdnGoForward = false,
              MkdnCreateLink = false, -- see MkdnEnter
              MkdnCreateLinkFromClipboard = false,
              MkdnFollowLink = false, -- see MkdnEnter
              MkdnDestroyLink = { 'n', '<M-CR>' },
              MkdnTagSpan = { 'v', '<M-CR>' },
              MkdnMoveSource = { 'n', '<F2>' },
              MkdnYankAnchorLink = { 'n', 'yaa' },
              MkdnYankFileAnchorLink = { 'n', 'yfa' },
              MkdnIncreaseHeading = false,
              MkdnDecreaseHeading = false,
              MkdnToggleToDo = { { 'n', 'v' }, '<leader>dt' },
              MkdnNewListItem = false,
              MkdnNewListItemBelowInsert = { 'n', 'o' },
              MkdnNewListItemAboveInsert = { 'n', 'O' },
              MkdnExtendList = false,
              MkdnUpdateNumbering = { 'n', '<leader>dn' },
              MkdnTableNextCell = { 'i', '<Tab>' },
              MkdnTablePrevCell = { 'i', '<S-Tab>' },
              MkdnTableNextRow = false,
              MkdnTablePrevRow = false,
              MkdnTableNewRowBelow = { 'n', '<leader>dr' },
              MkdnTableNewRowAbove = { 'n', '<leader>dR' },
              MkdnTableNewColAfter = { 'n', '<leader>dc' },
              MkdnTableNewColBefore = { 'n', '<leader>dC' },
              MkdnFoldSection = { 'n', '<leader>df' },
              MkdnUnfoldSection = { 'n', '<leader>dF' },
            }
          })
        end,
      },
    },
  },
})
