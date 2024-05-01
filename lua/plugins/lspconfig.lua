local utils = require 'utils'
local set_keymaps = utils.set_keymaps

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

local server_names = {
  'html',
  'cssls',
  'marksman',
  'volar',
  'clangd',
  'ocamllsp',
  'hls',
  'biome',
  'elmls',
  'prismals',
  'svelte',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'astro',
  'purescriptls',
  'clojure_lsp',
}

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

  hls = {
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
  },
}

for _, value in pairs(server_names) do
  servers[value] = {}
end

M.config = function()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function()
      set_keymaps {
        { 'n', 'gd', require('telescope.builtin').lsp_definitions },
        { 'n', 'gr', require('telescope.builtin').lsp_references },
        { 'n', 'gI', require('telescope.builtin').lsp_implementations },
        { 'n', '<leader>D', require('telescope.builtin').lsp_type_definitions },
        { 'n', '<leader>rn', vim.lsp.buf.rename },
        { 'n', '<leader>ca', vim.lsp.buf.code_action },
        { 'n', 'K', vim.lsp.buf.hover },
        { 'n', 'gD', vim.lsp.buf.declaration },
      }
    end,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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

print(vim.inspect(vim.tbl_keys(require 'lspconfig')))

return M
