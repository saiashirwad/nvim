return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				float = {
					max_height = 20,
					max_width = 60,
				},
			})
			vim.api.nvim_set_keymap("n", "<leader>oi", ":Oil<CR>", { noremap = true, silent = true })
		end,
	},
}
