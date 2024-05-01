---@type (LazyPluginSpec|string)[]
local dependencies = {
  { 'nvim-lua/plenary.nvim' },
  'nvim-telescope/telescope-fzf-native.nvim',
  'xiyaowong/telescope-emoji.nvim',
  'nvim-telescope/telescope-project.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
}

local keymaps = function()
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
    { 'gd', telescope.lsp_definitions },
    { 'gr', telescope.lsp_references },
    { '<leader>fb', telescope.buffers },
    { '<leader>fh', telescope.help_tags },
    { '<leader>fs', telescope.lsp_document_symbols },
    { '<leader>ws', telescope.lsp_workspace_symbols },
    { '<leader>fd', telescope.diagnostics },
  }
end

local extensions = {
  'fzf',
  'ui-select',
}

---@type LazyPluginSpec
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = dependencies,
  keys = keymaps,
  opts = {},
  config = function()
    for _, value in pairs(extensions) do
      pcall(require('telescope').load_extension, value)
    end
  end,
}
