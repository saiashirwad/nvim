local utils = require("utils")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			utils.lazy_load("nvim-treesitter")
		end,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
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
				autotag = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						node_incremental = "<CR>",
						scope_incremental = false,
						node_decremental = "<BS>",
					},
				},
			}
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
