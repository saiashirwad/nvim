local utils = require("utils")

local on_attach = function(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
	vim.keymap.set("n", "gr", vim.lsp.buf.references)
	vim.keymap.set("n", "K", vim.lsp.buf.hover)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
	vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		opts = {
			ensure_installed = { "lua-language-server" }, -- not an option from mason.nvim
			path = "skip",
			max_concurrent_installers = 10,
		},
		config = function(_, opts)
			require("mason").setup(opts)

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/typescript.nvim",
				init = function() end,
			},
		},
		init = function()
			utils.lazy_load("nvim-lspconfig")
			local icons = require("icons")

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,

				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							},
							maxPreload = 100000,
							preloadFileSize = 10000,
						},
					},
				},
			})

			local servers = {
				"html",
				"cssls",
				"marksman",
				"volar",
				"clangd",
				"ocamllsp",
				"hls",
				"biome",
				"prismals",
				"svelte",
				"tailwindcss",
				"jsonls",
				"pyright",
				"rust_analyzer",
				"astro",
			}

			local default_diagnostic_config = {
				signs = {
					active = true,
					values = {
						{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
						{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
						{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
						{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
					},
				},
				virtual_text = false,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}

			vim.diagnostic.config(default_diagnostic_config)

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			lspconfig["hls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "haskell", "lhaskell", "cabal" },
			})

			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				vim.lsp.buf.execute_command(params)
			end

			lspconfig.tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			})
		end,
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				inlayhints = {
					enabled = false,
				},
			},
		},
		config = function()
			return {
				on_attach = on_attach,
				capabilities = capabilities,
			}
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			local trouble = require("trouble")
			vim.keymap.set("n", "<leader>tt", trouble.toggle)
			vim.keymap.set("n", "<leader>xw", function()
				trouble.open("workspace_diagnostics")
			end)

			vim.keymap.set("n", "<leader>xd", function()
				trouble.open("document_diagnostics")
			end)

			vim.keymap.set("n", "<leader>tn", function()
				trouble.next({ jump = true, skip_groups = true })
			end)

			vim.keymap.set("n", "<leader>tp", function()
				trouble.previous({ jump = true, skip_groups = true })
			end)
		end,
	},

	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup({})
		end,
	},

	"JoosepAlviste/nvim-ts-context-commentstring",
}
