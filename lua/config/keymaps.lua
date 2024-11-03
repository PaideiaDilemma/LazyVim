-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- modes:
--  "n" - normal mode
--  "i" - insert mode
--  "x" - visual mode
--  "v" - visual and select mode

vim.keymap.set("x", "p", "P", { silent = true })
