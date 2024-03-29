return {
	{
		"echasnovski/mini.tabline",
		version = false,
		opts = {
			-- Whether to show file icons (requires 'nvim-tree/nvim-web-devicons')
			show_icons = true,

			-- Whether to set Vim's settings for tabline (make it always shown and
			-- allow hidden buffers)
			set_vim_settings = true,

			-- Where to show tabpage section in case of multiple vim tabpages.
			-- One of 'left', 'right', 'none'.
			tabpage_section = "left",
		},
	},

	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	opts = {},
	-- },
}
