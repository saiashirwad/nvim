vim.api.nvim_create_user_command("BDeleteOthers", function(opts)
	local buffers = vim.api.nvim_list_bufs()
	local current_buffer = vim.api.nvim_get_current_buf()

	for _, buffer in ipairs(buffers) do
		if buffer ~= current_buffer then
			vim.api.nvim_buf_delete(buffer, {})
		end
	end
end, { nargs = 0 })

vim.api.nvim_set_keymap("n", "<leader>bd", ":BDeleteOthers<CR>", { noremap = true, silent = true })
