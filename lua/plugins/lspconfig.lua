local utils = require 'utils'
local nnoremap = utils.nnoremap

---@type LazyPluginSpec
local M = {
  'neovim/nvim-lspconfig',
}

M.dependencies = {
  { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
  'williamboman/mason-lspconfig.nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  {
    'folke/neodev.nvim',
    opts = {},
  },
  { 'j-hui/fidget.nvim', opts = {} },
}

local organize_imports = function()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

M.config = function()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function()
      nnoremap('gd', require('telescope.builtin').lsp_definitions)
      nnoremap('gr', require('telescope.builtin').lsp_references)
      nnoremap('gI', require('telescope.builtin').lsp_implementations)
      nnoremap('<leader>D', require('telescope.builtin').lsp_type_definitions)
      nnoremap('<leader>rn', vim.lsp.buf.rename)
      nnoremap('<leader>ca', vim.lsp.buf.code_action)
      nnoremap('K', vim.lsp.buf.hover)
      nnoremap('gD', vim.lsp.buf.declaration)
    end,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

  local servers = {
    tsserver = {
      commands = {
        OrganizeImports = {
          organize_imports,
          description = 'Organize Imports',
        },
      },
    },

    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    },
  }

  require('mason').setup()

  local ensure_installed = vim.tbl_keys(servers)
  vim.list_extend(ensure_installed, { 'stylua' })

  require('mason-tool-installer').setup { ensure_installed = ensure_installed }
  require('mason-lspconfig').setup {
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
  }
end

return M
