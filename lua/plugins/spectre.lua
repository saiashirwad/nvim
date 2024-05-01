return require('utils').lazy_plugin {
  'nvim-pack/nvim-spectre',
  event = 'BufRead',
  config = function()
    require('spectre').setup()
  end,
  keys = function()
    local spectre = require 'spectre'
    return {
      { '<leader>sr', spectre.open, desc = 'Replace in files (Spectre)' },
    }
  end,
}
