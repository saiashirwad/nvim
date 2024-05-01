return require('utils').lazy_plugin {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',

      'xiyaowong/telescope-emoji.nvim',

      'nvim-telescope/telescope-project.nvim',
      {
        'ThePrimeagen/refactoring.nvim',
        config = function()
          require('refactoring').setup {}
        end,
      },

      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = function()
    local telescope = require 'telescope.builtin'
    local extensions = require('telescope').extensions

    return {
      { '<leader>ff', telescope.find_files },
      {
        '<leader>fc',
        function()
          telescope.find_files { search_dirs = { '~/.config' } }
        end,
      },
      {
        '<leader>fv',
        function()
          telescope.find_files { search_dirs = { '~/.config/nvim' } }
        end,
      },
      {
        '<leader>rr',
        function()
          extensions.refactoring.refactors()
        end,
      },
      {
        '<leader>fw',
        function()
          telescope.live_grep()
        end,
      },

      { '<leader>fl', telescope.resume },

      { 'gd', telescope.lsp_definitions },
      { 'gr', telescope.lsp_references },
      {
        '<C-g><C-g>',
        function()
          vim.cmd [[ vsplit ]]
          telescope.lsp_definitions()
        end,
      },
      {
        '<leader>fb',
        function()
          telescope.buffers()
        end,
      },
      { '<leader>fh', telescope.help_tags },

      { '<leader>fs', telescope.lsp_document_symbols },

      { '<leader>ws', telescope.lsp_workspace_symbols },

      { '<leader>fd', telescope.diagnostics },

      { '<leader>fe', extensions.emoji.emoji },
    }
  end,
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
