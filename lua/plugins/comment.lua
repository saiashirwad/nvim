---@type LazyPluginSpec
local M = {
  'numToStr/Comment.nvim',
}

M.dependencies = {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'VeryLazy',
  },
}

M.opts = {}

M.config = function()
  vim.g.skip_ts_context_commentstring_module = true
  require('ts_context_commentstring').setup {
    enable_autocmd = false,
  }

  require('Comment').setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
end

return M
