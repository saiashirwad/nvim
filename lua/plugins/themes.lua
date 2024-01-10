return {

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				no_italic = true,
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	-- {
	-- 	"Tsuzat/NeoSolarized.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("NeoSolarized").setup({
	-- 			transparent = true,
	-- 			enable_italics = false,
	-- 			styles = {
	-- 				-- Style to be applied to different syntax groups
	-- 				comments = { italic = true },
	-- 				keywords = { italic = false },
	-- 				functions = { bold = false },
	-- 				variables = {},
	-- 				string = { italic = false },
	-- 				underline = false,
	-- 				undercurl = false,
	-- 			},
	-- 		})
	-- 		vim.cmd([[colorscheme NeoSolarized]])
	-- 	end,
	-- },
}
