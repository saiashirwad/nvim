local M = {}

---@param plugin LazyPluginSpec
M.lazy_plugin = function(plugin)
  return plugin
end

M.init = function()
  require 'sai.keymaps'
  require 'sai.autocmds'

  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  end ---@diagnostic disable-next-line: undefined-field
  vim.opt.rtp:prepend(lazypath)
end

M.plugins_list = function(dict, skip_keys)
  local list = {}
  for key, value in pairs(dict) do
    if not skip_keys or not skip_keys[key] then
      table.insert(list, value)
    end
  end
end

---@param opts vim.opt
M.set_options = function(opts)
  for key, value in pairs(opts) do
    vim.opt[key] = value
  end
end

---@param plugins LazyPluginSpec[]
M.set_plugins = function(plugins)
  require('lazy').setup(plugins)
end

return M
