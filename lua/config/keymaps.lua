-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- tabs
local map = vim.keymap.set

map("n", "<tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<tab>k", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<tab>j", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
