local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.cursorline = false
opt.expandtab = true
opt.fillchars = { eob = " " }
opt.hlsearch = false
opt.ignorecase = true
opt.laststatus = 3
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 3
opt.shiftwidth = 2
opt.shortmess:append("sI")
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 400
opt.title = false
opt.undofile = true
opt.updatetime = 250
opt.whichwrap:append("<>[]hl")
opt.wildmode = "longest:full,full"
opt.wrap = false

-- Helper function for transparency formatting
local alpha = function()
	return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

if vim.g.neovide then
	vim.o.guifont = "Fira Code"
	vim.g.neovide_cursor_vfx_mode = "railgun"

	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.
	vim.g.neovide_background_color = "#0f1117" .. alpha()
end

-- vim.cmd([[
--   set foldmethod=expr
--   set foldexpr=nvim_treesitter#foldexpr()
-- ]])
