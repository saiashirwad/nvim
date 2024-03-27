return {
	{
		"LunarVim/darkplus.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- vim.cmd([[ colorscheme darkplus]])
		end,
	},

	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("material").setup({

				contrast = {
					terminal = true, -- Enable contrast for the built-in terminal
					sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
					floating_windows = true, -- Enable contrast for floating windows
					cursor_line = true, -- Enable darker background for the cursor line
					non_current_windows = false, -- Enable contrasted background for non-current windows
					filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
				},

				styles = { -- Give comments style such as bold, italic, underline etc.
					comments = { --[[ italic = true ]]
						italic = false,
					},
					strings = { --[[ bold = true ]]
					},
					keywords = { --[[ underline = true ]]
					},
					functions = { --[[ bold = true, undercurl = true ]]
					},
					variables = {},
					operators = {},
					types = {},
				},

				plugins = { -- Uncomment the plugins that you use to highlight them
					"flash",
					"gitsigns",
					"mini",
					"noice",
					"nvim-cmp",
					"nvim-web-devicons",
					"telescope",
					"trouble",
					"nvim-notify",
				},

				disable = {
					colored_cursor = false, -- Disable the colored cursor
					borders = false, -- Disable borders between verticaly split windows
					background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
					term_colors = false, -- Prevent the theme from setting terminal colors
					eob_lines = false, -- Hide the end-of-buffer lines
				},

				high_visibility = {
					lighter = false, -- Enable higher contrast text for lighter style
					darker = false, -- Enable higher contrast text for darker style
				},

				lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

				async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
			})

			vim.cmd([[ colorscheme material-palenight]])
		end,
	},
}
