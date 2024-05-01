---@type LazyPluginSpec
local M = {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
}

M.dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  'MunifTanjim/nui.nvim',
}

M.cmd = 'Neotree'

M.keys = {
  { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
}

M.opts = {
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

return M
