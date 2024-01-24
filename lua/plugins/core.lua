return {
  {
    "PaideiaDilemma/penumbra.nvim",
    event = "VeryLazy",
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
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = false, terminal = false },
      mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][ \n\r]" },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][ \n\r]" },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][ \n\r]" },

        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\][ \n\r]" },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\][ \n\r]" },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\][ \n\r]" },

        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\][ \n\r]", register = { cr = false } },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^\\][ \n\r]", register = { cr = false } },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\][ \n\r]", register = { cr = false } },
      },
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
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "jedi-language-server",
        "ruff",
        "clangd",
        "clang-format",
        "rust-analyzer",
        "typescript-language-server",
        "bash-language-server",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {},
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
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      win_options = {
        signcolumn = "yes:2",
      },
      delete_to_trash = true,
      lsp_rename_autosave = true,
      keymaps = {
        ["C-s"] = false,
        ["q"] = "actions.close",
      },
    },

    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      local map = vim.keymap.set
      local oil = require("oil")
      oil.setup(opts)

      map("n", "<leader>o", oil.toggle_float, { noremap = true, silent = true, desc = "Open Oil (cwd)" })

      map("n", "<leader>O", function()
        oil.toggle_float(vim.fn.expand("#"))
      end, { noremap = true, silent = true, desc = "Open Oil (root dir)" })
    end,
  },

  {
    "refractalize/oil-git-status.nvim",

    dependencies = {
      "stevearc/oil.nvim",
    },

    config = true,
    event = "LazyFile",
  },
}
