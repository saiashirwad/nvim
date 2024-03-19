return {
	{
		"RRethy/base16-nvim",
		config = function()
			-- require("base16-colorscheme").setup({
			-- 	base00 = "#181818",
			-- 	base01 = "#282828",
			-- 	base02 = "#383838",
			-- 	base03 = "#585858",
			-- 	base04 = "#b8b8b8",
			-- 	base05 = "#d8d8d8",
			-- 	base06 = "#e8e8e8",
			-- 	base07 = "#f8f8f8",
			-- 	base08 = "#f8f8f8",
			-- 	base09 = "#dc9656",
			-- 	base0A = "#f7ca88",
			-- 	base0B = "#a1b56c",
			-- 	base0C = "#86c1b9",
			-- 	base0D = "#7cafc2",
			-- 	base0E = "#ba8baf",
			-- 	base0F = "#a16946",
			-- })
		end,
	},

	{
		"EdenEast/nightfox.nvim",

		config = function()
			require("nightfox").setup({
				options = {
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					transparent = false, -- Disable setting background
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = false, -- Non focused panes set to alternative background
					module_default = true, -- Default enable value for modules
					colorblind = {
						enable = true, -- Enable colorblind support
						simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
						severity = {
							protan = 0, -- Severity [0,1] for protan (red)
							deutan = 0, -- Severity [0,1] for deutan (green)
							tritan = 0, -- Severity [0,1] for tritan (blue)
						},
					},
					styles = { -- Style to be applied to different syntax groups
						comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
						conditionals = "NONE",
						constants = "NONE",
						functions = "NONE",
						keywords = "NONE",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "NONE",
						variables = "NONE",
					},
					inverse = { -- Inverse highlight for different types
						match_paren = false,
						visual = false,
						search = false,
					},
					modules = { -- List of various plugins and additional options
						-- ...
					},
				},
				palettes = {},
				specs = {},
				groups = {},
			})

			-- vim.cmd([[ colorscheme nightfox]])
		end,
	},

	{
		"Mofiqul/vscode.nvim",
		config = function()
			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				transparent = false,
				italic_comments = false,
				underline_links = true,
			})
			require("vscode").load()
		end,
	},

	-- {
	-- 	"gbprod/nord.nvim",
	-- 	config = function()
	-- 		require("nord").setup({
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			transparent = true, -- Enable this to disable setting the background color
	-- 			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	-- 			diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
	-- 			borders = true, -- Enable the border between verticaly split windows visible
	-- 			errors = { mode = "bg" }, -- Display mode for errors and diagnostics
	-- 			-- values : [bg|fg|none]
	-- 			search = { theme = "vim" }, -- theme for highlighting search results
	-- 			-- values : [vim|vscode]
	-- 			styles = {
	-- 				-- Style to be applied to different syntax groups
	-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
	-- 				comments = { italic = true },
	-- 				keywords = {},
	-- 				functions = {},
	-- 				variables = {},
	-- 			},
	--
	-- 			on_highlights = function(highlights, colors) end,
	-- 		})
	-- 		vim.cmd([[colorscheme nord]])
	-- 	end,
	-- },
}
