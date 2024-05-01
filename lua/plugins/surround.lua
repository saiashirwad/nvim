return require('sai.utils').lazy_plugin {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup {}
  end,
}
