require 'types'
local M = {}

---@param plugin LazyPluginSpec
M.lazy_plugin = function(plugin)
  return plugin
end

M.nnoremap = function(keys, func)
  vim.keymap.set('n', keys, func, {
    silent = true,
    remap = true,
  })
end

M.set_keymaps = function(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.nnoremap(keymap[1], keymap[2])
  end
end

return M
