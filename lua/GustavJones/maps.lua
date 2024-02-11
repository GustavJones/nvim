vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", function()
	vim.cmd.Neotree("toggle")
end)

Savefunc = function()
	vim.cmd.write()
	vim.cmd.stopinsert()
end

vim.keymap.set("n", "<C-h>", function() vim.cmd.wincmd("h") end)
vim.keymap.set("i", "<C-h>", function() vim.cmd.wincmd("h") end)
vim.keymap.set("n", "<C-j>", function() vim.cmd.wincmd("j") end)
vim.keymap.set("i", "<C-j>", function() vim.cmd.wincmd("j") end)
vim.keymap.set("n", "<C-k>", function() vim.cmd.wincmd("k") end)
vim.keymap.set("i", "<C-k>", function() vim.cmd.wincmd("k") end)
vim.keymap.set("n", "<C-l>", function() vim.cmd.wincmd("l") end)
vim.keymap.set("i", "<C-l>", function() vim.cmd.wincmd("l") end)

vim.keymap.set("n", "<C-d>", function() vim.cmd.LspZeroFormat() end)
