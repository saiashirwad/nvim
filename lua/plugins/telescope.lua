---@type LazyPluginSpec
local M = {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
}

M.dependencies = {
  { 'nvim-lua/plenary.nvim' },
  'nvim-telescope/telescope-fzf-native.nvim',
  'xiyaowong/telescope-emoji.nvim',
  'nvim-telescope/telescope-project.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
}

M.keys = function()
  local telescope = require 'telescope.builtin'

  local find_files_in_config = function()
    telescope.find_files { search_dirs = { '~/.config' } }
  end

  local find_files_in_nvim = function()
    telescope.find_files { search_dirs = { '~/.config/nvim' } }
  end

  return {
    { '<leader>ff', telescope.find_files },
    { '<leader>fc', find_files_in_config },
    { '<leader>fv', find_files_in_nvim },
    { '<leader>fw', telescope.live_grep },
    { '<leader>fl', telescope.resume },
    { '<leader>fb', telescope.buffers },
    { '<leader>fh', telescope.help_tags },
    { '<leader>fs', telescope.lsp_document_symbols },
    { '<leader>ws', telescope.lsp_workspace_symbols },
    { '<leader>fd', telescope.diagnostics },
  }
end

M.opts = {}

M.config = function()
  for _, value in pairs { 'fzf', 'ui-select' } do
    pcall(require('telescope').load_extension, value)
  end
end

return M
