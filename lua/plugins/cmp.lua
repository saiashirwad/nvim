return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- {
			-- 	"L3MON4D3/LuaSnip",
			-- 	dependencies = "rafamadriz/friendly-snippets",
			-- 	opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			-- 	config = function(_, opts)
			-- 		require("luasnip").config.set_config(opts)
			--
			-- 		require("luasnip.loaders.from_vscode").lazy_load()
			-- 		require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })
			--
			-- 		require("luasnip.loaders.from_snipmate").load()
			-- 		require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })
			--
			-- 		require("luasnip.loaders.from_lua").load()
			-- 		require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })
			--
			-- 		vim.api.nvim_create_autocmd("InsertLeave", {
			-- 			callback = function()
			-- 				if
			-- 					require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
			-- 					and not require("luasnip").session.jump_active
			-- 				then
			-- 					require("luasnip").unlink_current()
			-- 				end
			-- 			end,
			-- 		})
			-- 	end,
			-- },

			{
				-- "saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			local cmp = require("cmp")
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
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "path" },
				},
			}
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
}
