return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({})
			vim.api.nvim_set_keymap("n", "<leader>oi", ":Oil<CR>", { noremap = true, silent = true })
		end,
	},
}
