vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

for _, map in ipairs({
	"<C-u>",
	"<C-d>",
	"n",
	"N",
	"<C-o>",
	"<C-i>",
}) do
	vim.api.nvim_set_keymap("n", map, map .. "zz", {
		noremap = true,
		silent = true,
	})
end

-- require("lazy").setup({
-- 	{
-- 		"vscode-neovim/vscode-neovim",
-- 		config = function()
-- 			local vscode = require("vscode-neovim")
-- 			vscode.notify("hi there")
-- 		end,
-- 	},
-- })
