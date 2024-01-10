vim.api.nvim_set_keymap("n", "[q", ":cprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })

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

vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>s'", function()
	print("','i")
	vim.cmd("normal xi','")
end)

vim.keymap.set("n", '<leader>s"', function()
	print('",i')
	vim.cmd('normal xi",')
end)

vim.keymap.set("n", "<leader>rc", function()
	vim.cmd("e " .. "$MYVIMRC")
end)
