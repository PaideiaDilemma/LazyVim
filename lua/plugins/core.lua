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
        "ruff-lsp",
        "clangd",
        "clang-format",
        "typescript-language-server",
        "bash-language-server",
      },
    },
  },
}
