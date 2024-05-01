---@type LazyPluginSpec
return {
  'alexghergh/nvim-tmux-navigation',
  opts = {},
  keys = function()
    local nvim_tmux_nav = require 'nvim-tmux-navigation'
    return {
      { '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = 'Navigate Left' } },
      { '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown, { desc = 'Navigate Down' } },
      { '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp, { desc = 'Navigate Up' } },
      { '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight, { desc = 'Navigate Right' } },
      { '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive, { desc = 'Navigate Last Active' } },
      { '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext, { desc = 'Navigate Next' } },
    }
  end,
}
