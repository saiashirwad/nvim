return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 100,
				italics = true,
				disable_italic_comments = false,
				sign_column_background = "none",
				ui_contrast = "low",
				dim_inactive_windows = false,
				diagnostic_text_highlight = false,
				diagnostic_virtual_text = "coloured",
				diagnostic_line_highlight = false,
				spell_foreground = false,
				show_eob = true,
				float_style = "bright",
				---@param highlight_groups Highlights
				---@param palette Palette
				on_highlights = function(highlight_groups, palette) end,
				---@param palette Palette
				colours_override = function(palette) end,
			})
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme tokyonight-storm")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- VertSplit = { fg = "muted", bg = "muted" },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})

			-- vim.cmd("colorscheme rose-pine")
			-- vim.cmd("colorscheme rose-pine-main")
			-- vim.cmd("colorscheme rose-pine-moon")
			-- vim.cmd("colorscheme rose-pine-dawn")
		end,
	},

	{
		"mcchrish/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			-- vim.cmd("colorscheme zenbones")
		end,
	},

	-- {
	-- 	"morhetz/gruvbox",
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },

	-- {
	-- 	"RRethy/base16-nvim",
	-- 	config = function()
	-- 		require("base16-colorscheme").setup({
	-- 			base00 = "#181818",
	-- 			base01 = "#282828",
	-- 			base02 = "#383838",
	-- 			base03 = "#585858",
	-- 			base04 = "#b8b8b8",
	-- 			base05 = "#d8d8d8",
	-- 			base06 = "#e8e8e8",
	-- 			base07 = "#f8f8f8",
	-- 			base08 = "#f8f8f8",
	-- 			base09 = "#dc9656",
	-- 			base0A = "#f7ca88",
	-- 			base0B = "#a1b56c",
	-- 			base0C = "#86c1b9",
	-- 			base0D = "#7cafc2",
	-- 			base0E = "#ba8baf",
	-- 			base0F = "#a16946",
	-- 		})
	-- 	end,
	-- },
}
