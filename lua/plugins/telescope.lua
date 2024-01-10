return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"xiyaowong/telescope-emoji.nvim",

			{
				"ThePrimeagen/refactoring.nvim",
				config = function()
					require("refactoring").setup({})
				end,
			},
		},
		cmd = "Telescope",
		keys = function()
			local telescope = require("telescope.builtin")
			local extensions = require("telescope").extensions
			local vertical_layout = {
				layout_strategy = "vertical",
				layout_config = {
					width = 0.8,
				},
			}
			local cursor_layout = {
				layout_strategy = "cursor",
				layout_config = {
					width = 0.3,
					height = 0.3,
				},
			}
			return {
				{
					"<leader>ff",
					function()
						telescope.find_files(vertical_layout)
					end,
				},
				{
					"<leader>fc",
					function()
						telescope.find_files({
							search_dirs = { "~/.config" },
							layout_strategy = "vertical",
							layout_config = {
								width = 0.8,
							},
						})
					end,
				},
				{
					"<leader>fv",
					function()
						telescope.find_files({
							search_dirs = { "~/.config/nvim" },
							layout_strategy = "vertical",
							layout_config = {
								width = 0.8,
							},
						})
					end,
				},
				{
					"<leader>rr",
					function()
						extensions.refactoring.refactors(cursor_layout)
					end,
				},
				{
					"<leader>fw",
					function()
						telescope.live_grep(vertical_layout)
					end,
				},
				{
					"<leader>fb",
					function()
						telescope.buffers(vertical_layout)
					end,
				},
				{ "<leader>fh", telescope.help_tags },
				-- { "gr", telescope.lsp_references },
				-- { "<leader>fp", extensions.projects.projects },
				{ "<leader>fs", telescope.lsp_document_symbols },
				{ "<leader>fd", telescope.diagnostics },
				{
					"<leader>fe",
					function()
						extensions.emoji.emoji(cursor_layout)
					end,
				},
			}
		end,
		opts = function()
			return {
				defaults = vim.tbl_extend(
					"force",
					require("telescope.themes").get_dropdown(), -- or get_cursor, get_ivy
					{
						vimgrep_arguments = {
							"rg",
							"-L",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
						},
						initial_mode = "insert",
						selection_strategy = "reset",
						file_ignore_patterns = { "node_modules" },
						layout_config = {
							center = { 1.0 },
						},
					}
				),
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				extensions_list = {
					"fzf",
					-- "projects",
					"emoji",
					"ui-select",
					"refactoring",
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},

	{ "nvim-telescope/telescope-ui-select.nvim" },
}
