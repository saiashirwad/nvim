return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		init = function()
			vim.keymap.set("n", "<leader>eo", "<cmd>NvimTreeToggle<CR>")
		end,
		opts = {
			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
			},

			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				adaptive_size = false,
				side = "left",
				preserve_window_proportions = true,
			},
			git = {
				enable = true,
				ignore = true,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},

	{
		"stevearc/oil.nvim",
		init = function()
			vim.keymap.set("n", "<leader>oi", "<cmd>Oil<CR>")
		end,
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
