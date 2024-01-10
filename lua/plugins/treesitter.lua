local utils = require("utils")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			utils.lazy_load("nvim-treesitter")
		end,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return {
				ensure_installed = { "lua" },
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = {
					enable = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						node_incremental = "<CR>",
						scope_incremental = false,
						node_decremental = "<S-CR>",
					},
				},
			}
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		enabled = false,
		init = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 0,
				min_window_height = 0,
				line_numbers = true,
				multiline_threshold = 20,
				trim_scope = "outer",
				mode = "cursor",
				separator = "=",
				zindex = 20,
				on_attach = nil,
			})
		end,
	},
}
