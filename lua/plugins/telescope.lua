return require('sai.utils').lazy_plugin {
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

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
