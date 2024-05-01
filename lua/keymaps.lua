local set_keymaps = require('utils').set_keymaps

set_keymaps {
  n = {
    { '<Esc>', '<cmd>nohlsearch<CR>' },
    { '<leader>vc', '<cmd>e $MYVIMRC<CR>' },
    { '[d', vim.diagnostic.goto_prev },
    { ']d', vim.diagnostic.goto_next },
  },
}
