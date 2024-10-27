-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

g.terminal_emulator = os.getenv("TERM_PROGRAM") or "xterm"

opt.spelllang = "en,de_de"
opt.spellsuggest = "fast"
opt.cursorline = false

opt.guifont = "FiraCode Nerd Font"

vim.lsp.set_log_level("off")

LazyVim.lazygit.theme.selectedLineBgColor = { bg = "Normal" }
