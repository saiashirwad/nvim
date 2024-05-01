---@type LazyPluginSpec
local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
}

M.dependencies = {
  'windwp/nvim-ts-autotag',
}

M.opts = {
  ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = { enable = true, disable = { 'ruby' } },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = false,
      node_decremental = '<BS>',
    },
  },
}

M.config = function(_, opts)
  require('nvim-treesitter.install').prefer_git = true
  ---@diagnostic disable-next-line: missing-fields
  require('nvim-treesitter.configs').setup(opts)
end

return M
