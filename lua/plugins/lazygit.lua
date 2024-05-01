return require('sai.utils').lazy_plugin {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<CR>')
  end,
}
