return require('sai.utils').lazy_plugin {
  'nvim-pack/nvim-spectre',
  event = 'BufRead',
  config = function()
    require('spectre').setup()
  end,
}
