-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- modes:
--  "n" - normal mode
--  "i" - insert mode
--  "x" - visual mode
--  "v" - visual and select mode

local map = vim.keymap.set

map("x", "p", "P", { silent = true })

-- jjui
local ok, jjui = pcall(require, "additions/jjui")
if ok and vim.fn.executable("jjui") == 1 then
  map("n", "<leader>jj", function()
    jjui({ cwd = LazyVim.root.git() })
  end, { desc = "JJUi (Root Dir)" })
  map("n", "<leader>jJ", function()
    jjui()
  end, { desc = "JJUi (cwd)" })
end
