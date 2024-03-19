vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cF",
				function()
					require("conform").format({ formatters = { "injected" } })
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "biome" },
					typescript = { "biome" },
					typescriptreact = { "biome" },
					prisma = { "prisma" },
					python = { "black" },
					haskell = { "fourmolu" },
					ocaml = { "ocamlformat" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					elm = { "elm-format" },
					purescript = { "purty" },
					clojure = { "cljstyle" },
				},
				formatters = {
					prisma = {
						command = "pnpm prisma format",
					},
				},
			})
		end,
	},
}
