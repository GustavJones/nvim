local colorscheme = "carbonfox"

vim.opt.timeout = true
vim.opt.timeoutlen = 150

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Goto left window", noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Goto bottom window", noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Goto top window", noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Goto right window", noremap = true, silent = true })

vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Goto left buffer", noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Goto right buffer", noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>", { desc = "Close buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { desc = "Goto Right buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bh", ":bprevious<CR>", { desc = "Goto Left buffer", noremap = true, silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "GustavJones" },
	{ import = "GustavJones.lsp" },
})

vim.cmd.colorscheme(colorscheme)
