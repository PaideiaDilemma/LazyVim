return {
  {
    "PaideiaDilemma/penumbra.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "penumbra",
    },
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      lazygit = {
        theme = {
          selectedLineBgColor = { bg = "Normal" },
          activeBorderColor = { fg = "SnacksPickerMatch", bold = true },
        },
      },
    },
  },

  {
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = false, command = false, terminal = false },
      --[[ appings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][ \n\r]" },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][ \n\r]" },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][ \n\r]" },

        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\][ \n\r]" },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\][ \n\r]" },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\][ \n\r]" },

        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\][ \n\r]", register = { cr = false } },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^\\][ \n\r]", register = { cr = false } },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\][ \n\r]", register = { cr = false } },
      }, ]]
      --
    },
  },
  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.component_separators = { "" }
      opts.options.section_separators = { left = "", right = "" }
    end,
  },
  {
    "SmiteshP/nvim-navic",
    enabled = false,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      automatic_installation = { exclude = { "clangd" } },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        zls = {
          mason = false,
        },
        clangd = {
          mason = false,
          setup = {
            fallbackFlags = { "-std=c++23" },
          },
        },
      },
    },
  },

  {
    "rafikdraoui/jj-diffconflicts",
    cmd = { "DiffEditor" },
    config = function()
      require("hunk").setup()
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  {
    "nvim-mini/mini.files",
    -- needs to override netrw as the default file browser
    lazy = false,
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 120,
      },
      options = {
        -- Whether to use for editing directories
        -- Disabled by default in LazyVim because neo-tree is used for that
        use_as_default_explorer = true,
      },
    },
    keys = {
      {
        "<leader>o",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0) or vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>O",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  },

  {

    "echaya/neowiki.nvim",
    opts = {
      wiki_dirs = {
        -- neowiki.nvim supports both absolute and tilde-expanded paths
        { name = "wiki", path = "~/wiki" },
      },
    },
    keys = {
      { "<leader>kw", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
      { "<leader>kW", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = "Open Wiki in Floating Window" },
      { "<leader>kt", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", desc = "Open Wiki in Tab" },
    },
  },
}
