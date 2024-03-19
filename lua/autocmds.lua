vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.prisma",
	callback = function()
		vim.cmd("w")
		vim.cmd([[ !pnpm prisma format ]])
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "kitty.conf",
	callback = function()
		vim.cmd("!kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf")
	end,
})

vim.api.nvim_create_user_command("ClangFormat", function()
	vim.cmd([[ :%!clang-format ]])
end, {
	nargs = 0,
})
