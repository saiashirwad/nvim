require 'types'
local M = {}

---@param plugin LazyPluginSpec
M.lazy_plugin = function(plugin)
  return plugin
end

---@class Keymap
---@field [1] 'n' | 'i' | 'v'
---@field [2] string
---@field [3] string | fun()
---@param keymaps Keymap[]
M.set_keymaps = function(keymaps)
  for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3], {
      silent = true,
      remap = true,
    })
  end
end

return M
