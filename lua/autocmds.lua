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
		vim.cmd([[!pnpm prisma format]])
	end,
})

local clang_format = function()
	vim.cmd([[: % !clang - format]])
end

vim.api.nvim_create_user_command("ClangFormat", clang_format, { nargs = 0 })
