return {
	{
		"sourcegraph/sg.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },

		-- If you have a recent version of lazy.nvim, you don't need to add this!
		build = "nvim -l build/init.lua",
		-- opts = {},
		config = function()
			require("sg").setup({})
			vim.keymap.set("n", "<leader>ct", ":CodyTask ")
			vim.keymap.set("n", "<leader>cc", ":CodyToggle<CR>")
		end,
	},
}
