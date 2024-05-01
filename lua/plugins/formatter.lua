---@type LazyPluginSpec
local M = {
  'stevearc/conform.nvim',
  lazy = false,
}

M.keys = {
  {
    '<leader>f',
    function()
      require('conform').format { async = true, lsp_fallback = true }
    end,
    mode = '',
    desc = '[F]ormat buffer',
  },
}

M.opts = {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 500,
      lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'biome' },
    typescript = { 'biome' },
    typescriptreact = { 'biome' },
    prisma = { 'prisma' },
    python = { 'black' },
    haskell = { 'fourmolu' },
    ocaml = { 'ocamlformat' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    elm = { 'elm-format' },
    purescript = { 'purty' },
    clojure = { 'cljstyle' },
    clojuredart = { 'cljstyle' },
    cljd = { 'cljstyle' },
    fennel = { 'fnlfmt' },
  },
  formatters = {
    prisma = {
      command = 'pnpm prisma format',
    },
  },
}

return M
