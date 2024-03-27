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
						telescope.find_files()
					end,
				},
				{
					"<leader>fc",
					function()
						telescope.find_files({ search_dirs = { "~/.config" } })
					end,
				},
				{
					"<leader>fv",
					function()
						telescope.find_files({ search_dirs = { "~/.config/nvim" } })
					end,
				},
				{
					"<leader>rr",
					function()
						extensions.refactoring.refactors()
					end,
				},
				{
					"<leader>fw",
					function()
						telescope.live_grep()
					end,
				},

				{
					"<leader>fl",
					function()
						telescope.resume()
					end,
				},

				{
					"gd",
					function()
						telescope.lsp_definitions()
					end,
				},
				{
					"<C-g><C-g>",
					function()
						vim.cmd([[ vsplit ]])
						telescope.lsp_definitions()
					end,
				},
				{
					"<leader>fb",
					function()
						telescope.buffers()
					end,
				},
				{ "<leader>fh", telescope.help_tags },
				{ "<leader>fs", telescope.lsp_document_symbols },
				{ "<leader>ws", telescope.lsp_workspace_symbols },
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
			local actions = require("telescope.actions")
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

				pickers = {
					live_grep = {
						theme = "dropdown",
					},

					grep_string = {
						theme = "dropdown",
					},

					find_files = {
						theme = "dropdown",
						previewer = false,
					},

					buffers = {
						theme = "dropdown",
						previewer = false,
						initial_mode = "normal",
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer,
							},
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
					},

					planets = {
						show_pluto = true,
						show_moon = true,
					},

					colorscheme = {
						enable_preview = true,
					},

					lsp_references = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_definitions = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_declarations = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_implementations = {
						theme = "dropdown",
						initial_mode = "normal",
					},
				},

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
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
