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
