require('texoport').init {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup()
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    init = function()
      local jump = require('flash').jump
      vim.keymap.set('n', 's', jump)
      vim.keymap.set('x', 's', jump)
      vim.keymap.set('o', 's', jump)
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<CR>')
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<C-f><C-o>', ':Oil<CR>', { desc = 'Open Oil' } },
    },
  },
  { 'duane9/nvim-rg' },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false, bold = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    },
    config = function()
      vim.o.background = 'dark' -- or 'light'
      vim.cmd.colorscheme 'solarized'
    end,
  },
  {
    'nvim-pack/nvim-spectre',
    lazy = false,
    event = 'BufRead',
    opts = {},
    keys = {
      { '<leader>sr', '<cmd>Spectre<CR>' },
    },
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  require 'plugins.cmp',
  require 'plugins.comment',
  require 'plugins.copilot',
  require 'plugins.formatter',
  require 'plugins.lint',
  require 'plugins.lspconfig',
  require 'plugins.multi-cursor',
  require 'plugins.neo_tree',
  require 'plugins.telescope',
  require 'plugins.tmux_navigation',
  require 'plugins.treesitter',
}
