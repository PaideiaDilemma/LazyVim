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
          selectedLineBgColor = { bg = "Normal" }, -- set to `default` to have no background colour
        },
      },
    },
  },

  {
    "echasnovski/mini.pairs",
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
    "williamboman/mason.nvim",
    opts = {
      automatic_installation = { exclude = { "clangd" } },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        clangd = {
          mason = false,
        },
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    lazy = true,
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = { accept = "<C-c>" },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>o",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
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
}
