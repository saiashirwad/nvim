local M = {}

require 'types'

---@param plugins LazyPluginSpec[]
M.init = function(plugins)
  vim.g.have_nerd_font = true
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  require 'keymaps'
  require 'autocmds'
  require 'options'

  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  end ---@diagnostic disable-next-line: undefined-field
  vim.opt.rtp:prepend(lazypath)

  require('lazy').setup(plugins)
end

return M
