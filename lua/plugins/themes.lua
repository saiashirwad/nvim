return {

	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				dim_inactive = false,
				styles = {
					-- sidebars = "transparent",
					-- floats = "transparent",
				},
				on_highlights = function(hl, c)
					hl.LspDiagnosticsDefaultHint = { fg = c.blue }
					hl.LspDiagnosticsDefaultInformation = { fg = c.blue }
					hl.LspDiagnosticsDefaultWarning = { fg = c.yellow }
					hl.LspDiagnosticsDefaultError = { fg = c.red }
					-- remove telescope background
					hl.TelescopeNormal = { bg = "NONE" }
					hl.TelescopeBorder = { bg = "NONE" }
					hl.TelescopePromptBorder = { bg = "NONE" }
					hl.TelescopeResultsBorder = { bg = "NONE" }
					hl.TelescopePreviewBorder = { bg = "NONE" }
				end,
			})

			vim.cmd([[colorscheme tokyonight-storm]])
		end,
	},
}
