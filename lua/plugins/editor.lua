return {
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		init = function()
			local jump = require("flash").jump
			vim.keymap.set("n", "s", jump)
			vim.keymap.set("x", "s", jump)
			vim.keymap.set("o", "s", jump)
		end,
	},

	{ "tpope/vim-surround", event = "VeryLazy" },

	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = function()
			local spectre = require("spectre")
			return {
				{ "<leader>sr", spectre.open, desc = "Replace in files (Spectre)" },
			}
		end,
	},

	{ "kevinhwang91/nvim-bqf" },

	{
		"famiu/bufdelete.nvim",
		cmd = "BufDelete",
		event = "VeryLazy",
		lazy = false,
	},
}
