return {
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		event = "InsertEnter",
		dependencies = {
			{
				"delphinus/cmp-ctags",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			local cmp = require("cmp")
			local icons = require("icons")
			return {
				completion = {
					completeopt = "menu,menuone",
					autocomplete = false,
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						vim_item.kind = icons.kind[vim_item.kind]
						vim_item.menu = ({
							nvim_lsp = "",
							nvim_lua = "",
							buffer = "",
							path = "",
							emoji = "",
						})[entry.source.name]

						if entry.source.name == "emoji" then
							vim_item.kind = icons.misc.Smiley
							vim_item.kind_hl_group = "CmpItemKindEmoji"
						end

						if entry.source.name == "cmp_tabnine" then
							vim_item.kind = icons.misc.Robot
							vim_item.kind_hl_group = "CmpItemKindTabnine"
						end

						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "path" },
					{
						name = "ctags",
						option = {
							executable = "ctags",
							trigger_characters = { "." },
							trigger_characters_ft = {},
						},
					},
				},
			}
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
}
