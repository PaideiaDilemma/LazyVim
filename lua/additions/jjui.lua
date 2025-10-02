---@class jjui
---@overload fun(opts?: jjui.Config): snacks.win
local M = setmetatable({}, {
  __call = function(t, ...)
    return t.open(...)
  end,
})

M.meta = {
  desc = "Open jjui in a float",
}

---@class jjui.Config: snacks.terminal.Opts
---@field args? string[]
local defaults = {
  config = {
    os = { editPreset = "nvim-remote" },
    gui = {
      -- set to an empty string "" to disable icons
      nerdFontsVersion = "3",
    },
  },
  win = {
    style = "jjui",
  },
}

Snacks.config.style("jjui", {})

-- Opens jjui, properly configured to use the current colorscheme
-- and integrate with the current neovim instance
---@param opts? jjui.Config
function M.open(opts)
  ---@type jjui.Config
  opts = Snacks.config.get("jjui", defaults, opts)

  local cmd = { "jjui" }
  vim.list_extend(cmd, opts.args or {})

  return Snacks.terminal(cmd, opts)
end

-- Opens jjui with the log view
---@param opts? jjui.Config
function M.log(opts)
  opts = opts or {}
  opts.args = opts.args or { "log" }
  return M.open(opts)
end

---@private
function M.health()
  local ok = vim.fn.executable("jjui") == 1
  Snacks.health[ok and "ok" or "error"](("{jjui} %sinstalled"):format(ok and "" or "not "))
end

return M
