vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local utils = require 'sai.utils'

utils.init()

utils.set_options {
  number = true,
  wrap = false,
  termguicolors = true,
  relativenumber = true,
  mouse = 'a',
  showmode = false,
  clipboard = 'unnamedplus',
  breakindent = true,
  undofile = true,
  ignorecase = true,
  smartcase = true,
  signcolumn = 'no',
  updatetime = 250,
  timeoutlen = 300,
  splitright = true,
  splitbelow = true,
  list = true,
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },
  inccommand = 'split',
  cursorline = true,
  cursorlineopt = 'screenline',
  scrolloff = 10,
  hlsearch = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
}

utils.set_plugins {
  { 'tpope/vim-sleuth' },
  require 'sai.tmux_navigation',
  require 'plugins.cmp',
  require 'plugins.lint',
  require 'plugins.neo_tree',
  require 'plugins.comment',
  require 'plugins.gitsigns',
  require 'plugins.autopairs',
  require 'plugins.surround',
  require 'plugins.spectre',
  require 'plugins.oil',
  require 'plugins.telescope',
  require 'plugins.lspconfig',
  require 'plugins.formatter',
  require 'plugins.solarized',
  require 'plugins.copilot',
  require 'plugins.todo_comments',
  require 'plugins.mini',
  require 'plugins.treesitter',
}
