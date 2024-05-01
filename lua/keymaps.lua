local set_keymaps = require('utils').set_keymaps

set_keymaps {
  { 'n', '<Esc>', '<cmd>nohlsearch<CR>' },
  { 'n', '<leader>vc', '<cmd>e $MYVIMRC<CR>' },
  { 'n', '[d', vim.diagnostic.goto_prev },
  { 'n', ']d', vim.diagnostic.goto_next },
}
